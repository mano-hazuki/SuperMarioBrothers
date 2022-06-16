public class Entity {

    private float posX;
    private float posY;

    private float width;
    private float height;
    
    private boolean dead;

    public Entity(float posX, float posY, float width, float height) {
        this.posX = posX;
        this.posY = posY;
        this.width = width;
        this.height = height;
        dead = false;
    }

    public float getPosX() {
        return posX;
    }

    public float getPosY() {
        return posY;
    }

    public float getWidth() {
        return width;
    }

    public float getHeight() {
        return height;
    }
    
    public boolean isDead() {
        return dead;
    }
    
    public void setDead(boolean dead) {
        this.dead = dead;
    }
}

public class EntityPlayer extends Entity {

    private final Sprite[] sprites;

    public EntityPlayer(Sprite[] sprites, float posX, float posY, float width, float height) {
        super(posX, posY, width, height);
        this.sprites = sprites;
    }

    public Sprite[] getSprites() {
        return sprites;
    }
}

public class EntityMario extends EntityPlayer {

    public EntityMario(Sprite[] sprites, float posX, float posY, float width, float height) {
        super(sprites, posX, posY, width, height);
    }
}

public class EntityLuigi extends EntityPlayer {

    public EntityLuigi(Sprite[] sprites, float posX, float posY, float width, float height) {
        super(sprites, posX, posY, width, height);
    }
}

public class EntityManager {
}

public class EntityRenderer {
}
