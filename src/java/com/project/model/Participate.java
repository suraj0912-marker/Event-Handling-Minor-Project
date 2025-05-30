package com.project.model;

public class Participate {
    private int id;
    private String studentEmail;
    private int eventId;
    private String eventName;

    public Participate() {}

    public Participate(String studentEmail, int eventId, String eventName) {
        this.studentEmail = studentEmail;
        this.eventId = eventId;
        this.eventName = eventName;
    }

    public Participate(int id, String studentEmail, int eventId, String eventName) {
        this.id = id;
        this.studentEmail = studentEmail;
        this.eventId = eventId;
        this.eventName = eventName;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getStudentEmail() { return studentEmail; }
    public void setStudentEmail(String studentEmail) { this.studentEmail = studentEmail; }

    public int getEventId() { return eventId; }
    public void setEventId(int eventId) { this.eventId = eventId; }

    public String getEventName() { return eventName; }
    public void setEventName(String eventName) { this.eventName = eventName; }
}
