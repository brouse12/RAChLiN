package io.seeport.jsonAPI.action;

import io.seeport.jsonAPI.model.JSONQueryResult;
import io.seeport.jsonAPI.model.TimeSpan;
import com.opensymphony.xwork2.ActionSupport;

public class TimeAction extends ActionSupport {
  private static final long serialVersionUID = 1L;
  private JSONQueryResult queryResult;
  private TimeSpan timeSpan;

  public String execute() {
    queryResult = JSONQueryResult.getInstance();
    queryResult.setTimeSpan(timeSpan);
    return SUCCESS;
  }

  public void setTimeSpan(TimeSpan timeSpan) {
    this.timeSpan = timeSpan;
  }

  public TimeSpan getTimeSpan() {
    return timeSpan;
  }

  public JSONQueryResult getQueryResult() {
    return queryResult;
  }

  public void setQueryResult(JSONQueryResult queryResult) {
    this.queryResult = queryResult;
  }
}