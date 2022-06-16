public class Camera {

    private float centerX;
    private float centerY;

    private float width;
    private float height;

    private float left;
    private float right;
    private float top;
    private float bottom;

    public Camera(float centerX, float centerY, float width, float height) {
        this.centerX = centerX;
        this.centerY = centerY;
        this.width = width;
        this.height = height;
        this.left = centerX - width / 2.0F;
        this.right = centerX + width / 2.0F;
        this.top = centerY - height / 2.0F;
        this.bottom = centerY + height / 2.0F;
    }

    // Follow the entity
    public void trackEntity(Entity entity) {
        float centerX = entity.getPosX();
        float centerY = entity.getPosY();

        move(centerX, centerY);
    }

    public void move(float centerX, float centerY) {
        this.centerX = centerX;
        this.centerY = centerY;

        this.left = centerX - width / 2.0F;
        this.right = centerX + width / 2.0F;
        this.top = centerY - height / 2.0F;
        this.bottom = centerY + height / 2.0F;
    }

    public float getCenterX() {
        return centerX;
    }

    public float getCenterY() {
        return centerY;
    }

    public float getLeft() {
        return left;
    }

    public float getRight() {
        return right;
    }

    public float getTop() {
        return top;
    }

    public float getBottom() {
        return bottom;
    }
}
