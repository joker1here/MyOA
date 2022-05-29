package oa.pojo;

public class Todo {
    private int TodoId;
    private String TodoText;
    private int TodoFinish;
    private int EmployeeId;
    private Employee employee;

    public int getTodoId() {
        return TodoId;
    }

    public void setTodoId(int todoId) {
        TodoId = todoId;
    }

    public String getTodoText() {
        return TodoText;
    }

    public void setTodoText(String todoText) {
        TodoText = todoText;
    }

    public int getTodoFinish() {
        return TodoFinish;
    }

    public void setTodoFinish(int todoFinish) {
        TodoFinish = todoFinish;
    }

    public int getEmployeeId() {
        return EmployeeId;
    }

    public void setEmployeeId(int employeeId) {
        EmployeeId = employeeId;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "TodoId=" + TodoId +
                ", TodoText='" + TodoText + '\'' +
                ", TodoFinish=" + TodoFinish +
                ", EmployeeId=" + EmployeeId +
                ", employee=" + employee +
                '}';
    }
}
