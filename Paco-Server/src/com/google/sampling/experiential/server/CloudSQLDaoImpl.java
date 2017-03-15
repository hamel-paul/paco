package com.google.sampling.experiential.server;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.sampling.experiential.model.Event;
import com.google.sampling.experiential.shared.EventDAO;
import com.google.sampling.experiential.shared.WhatDAO;
import com.pacoapp.paco.shared.model2.EventBaseColumns;
import com.pacoapp.paco.shared.model2.OutputBaseColumns;

import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.insert.Insert;

public class CloudSQLDaoImpl implements CloudSQLDao {
  public static final Logger log = Logger.getLogger(CloudSQLDaoImpl.class.getName());
  private static Map<String, Integer> eventsOutputColumns = null;

  private static void loadColumnTableAssociationMap() {
    if (eventsOutputColumns == null) {
      eventsOutputColumns = new HashMap<String, Integer>();
      eventsOutputColumns.put(EventBaseColumns.EXPERIMENT_ID, 1);
      eventsOutputColumns.put(EventBaseColumns.EXPERIMENT_NAME, 2);
      eventsOutputColumns.put(EventBaseColumns.EXPERIMENT_VERSION, 3);
      eventsOutputColumns.put(EventBaseColumns.SCHEDULE_TIME, 4);
      eventsOutputColumns.put(EventBaseColumns.RESPONSE_TIME, 5);
      eventsOutputColumns.put(EventBaseColumns.GROUP_NAME, 6);
      eventsOutputColumns.put(EventBaseColumns.ACTION_TRIGGER_ID, 7);
      eventsOutputColumns.put(EventBaseColumns.ACTION_TRIGGER_SPEC_ID, 8);
      eventsOutputColumns.put(EventBaseColumns.ACTION_ID, 9);
      eventsOutputColumns.put(EventBaseColumns.WHO, 10);
      eventsOutputColumns.put(EventBaseColumns.PACO_VERSION, 11);
      eventsOutputColumns.put(EventBaseColumns.APP_ID, 12);
      eventsOutputColumns.put("events._id", 13);
      eventsOutputColumns.put("_id", 14);
      eventsOutputColumns.put(OutputBaseColumns.NAME, 15);
      eventsOutputColumns.put(OutputBaseColumns.ANSWER, 16);
    }
  }

  @Override
  public boolean insertEvent(Event event) throws SQLException {
    if (event == null) {
      log.warning("nothing to eventInsert");
      return false;
    }

    Connection conn = null;
    PreparedStatement statementCreateEvent = null;
    PreparedStatement statementCreateEventOutput = null;
    boolean retVal = false;
    ExpressionList eventExprList = new ExpressionList();
    ExpressionList outputExprList = new ExpressionList();
    List<Expression> exp = Lists.newArrayList();
    List<Expression> out = Lists.newArrayList();
    Insert eventInsert = new Insert();
    Insert outputInsert = new Insert();
    List<Column> eventColList = Lists.newArrayList();
    List<Column> outputColList = Lists.newArrayList();
    DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
    eventColList.add(new Column("_Id"));
    eventColList.add(new Column(EventBaseColumns.EXPERIMENT_ID));
    eventColList.add(new Column(EventBaseColumns.EXPERIMENT_NAME));
    eventColList.add(new Column(EventBaseColumns.EXPERIMENT_VERSION));
    eventColList.add(new Column(EventBaseColumns.RESPONSE_TIME));
    eventColList.add(new Column(EventBaseColumns.SCHEDULE_TIME));
    eventColList.add(new Column(EventBaseColumns.GROUP_NAME));
    eventColList.add(new Column(EventBaseColumns.ACTION_ID));
    eventColList.add(new Column(EventBaseColumns.ACTION_TRIGGER_ID));
    eventColList.add(new Column(EventBaseColumns.ACTION_TRIGGER_SPEC_ID));
    eventColList.add(new Column(EventBaseColumns.WHO));
    eventColList.add(new Column("`" + EventBaseColumns.WHEN + "`"));
    eventColList.add(new Column(EventBaseColumns.PACO_VERSION));
    eventColList.add(new Column(EventBaseColumns.APP_ID));
    eventColList.add(new Column(EventBaseColumns.JOINED));
    eventColList.add(new Column(EventBaseColumns.SORT_DATE));
    outputColList.add(new Column(OutputBaseColumns.EVENT_ID));
    outputColList.add(new Column(OutputBaseColumns.NAME));
    outputColList.add(new Column(OutputBaseColumns.ANSWER));

    try {
      log.info("eventInserting event->" + event.getId());
      conn = CloudSQLConnectionManager.getInstance().getConnection();
      conn.setAutoCommit(false);
      eventInsert.setTable(new Table("events"));
      outputInsert.setTable(new Table("outputs"));
      eventInsert.setUseValues(true);
      outputInsert.setUseValues(true);
      eventExprList.setExpressions(exp);
      outputExprList.setExpressions(out);
      eventInsert.setItemsList(eventExprList);
      outputInsert.setItemsList(outputExprList);
      eventInsert.setColumns(eventColList);
      outputInsert.setColumns(outputColList);

      ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new LongValue(event.getId()));
      ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new LongValue(event.getExperimentId()));
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(new StringValue(quote(event.getExperimentName())));
      ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new LongValue(event.getExperimentVersion()));
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(event.getResponseTime() != null ? new StringValue(quote(event.getResponseTimeWithTimeZone(null)
                                                                                                                     .toString(fmt)))
                                                                                        : null);
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(event.getScheduledTime() != null ? new StringValue(quote(event.getScheduledTimeWithTimeZone(null)
                                                                                                                      .toString(fmt)))
                                                                                         : null);
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(new StringValue(quote(event.getExperimentGroupName())));
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(event.getActionId() != null ? new LongValue(event.getActionId())
                                                                                    : null);
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(event.getActionTriggerId() != null ? new LongValue(event.getActionTriggerId())
                                                                                           : null);
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(event.getActionTriggerSpecId() != null ? new LongValue(event.getActionTriggerSpecId())
                                                                                               : null);
      ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new StringValue(quote(event.getWho())));
      if (event.getWhen() != null) {
        DateTime whenDate = new DateTime(event.getWhen());
        ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                     .add(new StringValue(quote(whenDate.toString(fmt))));
      }
      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(new StringValue(quote(event.getPacoVersion())));
      ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new StringValue(quote(event.getAppId())));
      String joinedStat = event.getWhatByKey("joined");
      if (joinedStat != null) {
        if (joinedStat.equalsIgnoreCase("true")) {
          ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new LongValue(1));
        } else {
          ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(new LongValue(0));
        }
      } else {
        ((ExpressionList) eventInsert.getItemsList()).getExpressions().add(null);
      }

      ((ExpressionList) eventInsert.getItemsList()).getExpressions()
                                                   .add(event.getResponseTime() != null ? new StringValue(quote(event.getResponseTimeWithTimeZone(null)
                                                                                                                     .toString(fmt)))
                                                                                        : new StringValue(quote(event.getScheduledTimeWithTimeZone(null)
                                                                                                                     .toString(fmt))));

      for (String key : event.getWhatKeys()) {
        String whatAnswer = event.getWhatByKey(key);
        ((ExpressionList) outputInsert.getItemsList()).getExpressions().add(new LongValue(event.getId()));
        ((ExpressionList) outputInsert.getItemsList()).getExpressions().add(new StringValue(quote(key)));
        ((ExpressionList) outputInsert.getItemsList()).getExpressions()
                                                      .add(whatAnswer != null ? new StringValue(quote(whatAnswer))
                                                                              : null);
      }

      statementCreateEvent = conn.prepareStatement(eventInsert.toString());
      statementCreateEvent.execute();

      statementCreateEventOutput = conn.prepareStatement(outputInsert.toString());
      statementCreateEventOutput.executeBatch();

      conn.commit();

      retVal = true;
    } catch (SQLException e) {
      log.info("While inserting event : " + e);
    } catch (Exception e) {
      log.info("While inserting event -Gen : " + e);
    } finally {
      try {
        if (statementCreateEventOutput != null) {
          statementCreateEventOutput.close();
        }
        if (statementCreateEvent != null) {
          statementCreateEvent.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException ex1) {
        log.warning("While closing conn for insert event" + ex1);
      }
    }
    return retVal;
  }

  @Override
  public List<EventDAO> getEvents(String query) throws SQLException {
    List<EventDAO> evtList = Lists.newArrayList();
    EventDAO event = null;
    Connection conn = null;
    Map<Long, EventDAO> eventMap = null;
    PreparedStatement statementSelectEvent = null;
    ResultSet rs = null;

    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
      statementSelectEvent = conn.prepareStatement(query, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
      statementSelectEvent.setFetchSize(Integer.MIN_VALUE);
      Long stTime = System.nanoTime();
      rs = statementSelectEvent.executeQuery();

      log.info("step 1 query " + query + "took" + (System.nanoTime() - stTime));

      // to maintain the insertion order
      eventMap = Maps.newLinkedHashMap();
      Long dt = System.nanoTime();
      if (rs != null) {
        evtList = Lists.newArrayList();
        while (rs.next()) {
          event = createEvent(rs);
          EventDAO oldEvent = eventMap.get(event.getId());
          if (oldEvent == null) {
            eventMap.put(event.getId(), event);
          } else {
            // Will go through following when the query contains text in
            // ('a','b','v') or answer in(....)
            List<WhatDAO> oldOut = oldEvent.getWhat();
            List<WhatDAO> newOut = event.getWhat();
            // add all new output to the existing event in map
            oldOut.addAll(newOut);
          }
        }
      }
      // TODO step 2 sometimes takes 4 times longer to execute than the query.
      // Not sure why??
      log.info("step 2 proc took" + (System.nanoTime() - dt));
    } finally {
      try {
        if (statementSelectEvent != null) {
          statementSelectEvent.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException ex1) {
        log.warning("sqlexception while inserting event close conn" + ex1);
      }
    }
    if (eventMap != null) {
      evtList = Lists.newArrayList(eventMap.values());
    }
    return evtList;
  }

  private EventDAO createEvent(ResultSet rs) {
    loadColumnTableAssociationMap();
    EventDAO e = new EventDAO();
    List<WhatDAO> whatList = Lists.newArrayList();
    // setting an empty map for possible outputs. Even if the qry does not ask
    // for output fields, we send an empty output map
    e.setWhat(whatList);
    try {
      ResultSetMetaData rsmd = rs.getMetaData();
      for (int i = 1; i <= rsmd.getColumnCount(); i++) {
        String tempColNameInRS = rsmd.getColumnName(i);
        String colLower = tempColNameInRS.toLowerCase();
        Integer colIndex = eventsOutputColumns.get(colLower);
        if (colIndex != null) {
          switch (colIndex) {
          case 1:
            e.setExperimentId(rs.getLong(i));
            break;
          case 2:
            e.setExperimentName(rs.getString(i));
            break;
          case 3:
            e.setExperimentVersion(rs.getInt(i));
            break;
          case 4:
            e.setScheduledTime(rs.getTimestamp(i));
            break;
          case 5:
            e.setResponseTime(rs.getTimestamp(i));
            break;
          case 6:
            e.setExperimentGroupName(rs.getString(i));
            break;
          case 7:
            e.setActionTriggerId(rs.getLong(i));
            break;
          case 8:
            e.setActionTriggerSpecId(rs.getLong(i));
            break;
          case 9:
            e.setActionId(rs.getLong(i));
            break;
          case 10:
            e.setWho(rs.getString(i));
            break;
          case 11:
            e.setPaco_version(rs.getString(i));
            break;
          case 12:
            e.setAppId(rs.getString(i));
            break;
          case 13:
          case 14:
            e.setId(rs.getLong(i));
            break;
          case 15:
            List<WhatDAO> whTextLst = e.getWhat();
            whTextLst.add(new WhatDAO(OutputBaseColumns.NAME, rs.getString(i)));
            break;
          case 16:
            List<WhatDAO> whAnsLst = e.getWhat();
            whAnsLst.add(new WhatDAO(OutputBaseColumns.ANSWER, rs.getString(i)));
            break;
          }
        }
      }
    } catch (SQLException ex) {
      log.warning("exception while mapping resultset to pojo" + ex);
    }
    return e;
  }

  @Override
  public String createTables() throws SQLException {
    String retString = null;
    Connection conn = null;
    PreparedStatement statementCreateEvent = null;
    PreparedStatement statementCreateOutput = null;

    try {

      conn = CloudSQLConnectionManager.getInstance().getConnection();
      // TODO Sub Partition size for the experiment hash bucket
      final String createEventsTableSql = "CREATE TABLE `events` (" +

                                          "`_id` bigint(20) NOT NULL," + "`" + EventBaseColumns.EXPERIMENT_ID
                                          + "` bigint(20) NOT NULL," + "`" + EventBaseColumns.EXPERIMENT_NAME
                                          + "` varchar(45) DEFAULT NULL," + "`" + EventBaseColumns.EXPERIMENT_VERSION
                                          + "` int(11) DEFAULT NULL," + "`" + EventBaseColumns.SCHEDULE_TIME
                                          + "` datetime DEFAULT NULL," + "`" + EventBaseColumns.RESPONSE_TIME
                                          + "` datetime DEFAULT NULL," + "`" + EventBaseColumns.GROUP_NAME
                                          + "` varchar(45) DEFAULT NULL," + "`" + EventBaseColumns.ACTION_ID
                                          + "` bigint(20) DEFAULT NULL," + "`" + EventBaseColumns.ACTION_TRIGGER_ID
                                          + "` bigint(20) DEFAULT NULL," + "`" + EventBaseColumns.ACTION_TRIGGER_SPEC_ID
                                          + "` bigint(20) DEFAULT NULL," + "`" + EventBaseColumns.WHO
                                          + "` varchar(45) DEFAULT NULL," + "`" + EventBaseColumns.PACO_VERSION
                                          + "` varchar(45) DEFAULT NULL," + "`" + EventBaseColumns.APP_ID
                                          + "` varchar(45) DEFAULT NULL," + "`" + EventBaseColumns.WHEN
                                          + "` datetime DEFAULT NULL," + "`" + EventBaseColumns.ARCHIVE_FLAG
                                          + "` tinyint(4) NOT NULL DEFAULT '0'," + "`" + EventBaseColumns.JOINED
                                          + "` tinyint(1)  DEFAULT NULL," + "`" + EventBaseColumns.SORT_DATE
                                          + "` datetime  DEFAULT NULL," + "PRIMARY KEY (`_id`)," + "KEY `when_index` (`"
                                          + EventBaseColumns.WHEN + "`)," + "KEY `exp_id_resp_time_index` (`"
                                          + EventBaseColumns.EXPERIMENT_ID + "`,`response_time`),"
                                          + "KEY `exp_id_when_index` (`" + EventBaseColumns.EXPERIMENT_ID + "`,`when`),"
                                          + "KEY `exp_id_who_when_index` (`" + EventBaseColumns.EXPERIMENT_ID
                                          + "`,`who`,`when`)" + ") ENGINE=InnoDB DEFAULT CHARSET=latin1";

      final String createOutputsTableSql = "CREATE TABLE `outputs` (" + "`" + OutputBaseColumns.EVENT_ID
                                           + "` bigint(20) NOT NULL," + "`" + OutputBaseColumns.NAME
                                           + "` varchar(45) NOT NULL," + "`" + OutputBaseColumns.ANSWER
                                           + "` varchar(45) DEFAULT NULL," + "`" + OutputBaseColumns.ARCHIVE_FLAG
                                           + "` tinyint(4) NOT NULL DEFAULT '0'," + "PRIMARY KEY (`"
                                           + OutputBaseColumns.EVENT_ID + "`,`" + OutputBaseColumns.NAME + "`),"
                                           + "KEY `event_id_index` (`" + OutputBaseColumns.EVENT_ID + "`),"
                                           + "KEY `text_index` (`" + OutputBaseColumns.NAME + "`)"
                                           + ") ENGINE=InnoDB DEFAULT CHARSET=latin1";

      statementCreateEvent = conn.prepareStatement(createEventsTableSql);

      statementCreateEvent.execute();
      log.info("created events");
      // TODO better handling
      retString = "created events table. ";
      statementCreateOutput = conn.prepareStatement(createOutputsTableSql);

      statementCreateOutput.execute();
      log.info("created outputs");
      // TODO better handling
      retString = retString + "Created outputs table";
    } finally {
      try {
        if (statementCreateEvent != null) {
          statementCreateEvent.close();
        }
        if (statementCreateOutput != null) {
          statementCreateOutput.close();
        }
        if (conn != null) {
          conn.close();
        }

      } catch (SQLException ex1) {
        log.warning("sqlexception while creating event close conn" + ex1);
      }
    }
    return retString;
  }

  private static String quote(String inp) {
    StringBuilder sb = new StringBuilder();
    sb.append("'").append(inp).append("'");
    return sb.toString();
  }

}
