package enchufateapp.model;

public enum Role {
    ROLE_ADMIN(2), ROLE_USER(1), ROLE_ROOT(3);
	
	private int id;
	
	Role(int id) {
        this.id = id;
    }
	
	public int getId() {
        return id;
    }
}
