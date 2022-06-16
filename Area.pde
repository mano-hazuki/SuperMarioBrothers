public class Area {

    private final String dataFileDir = "areas/";

    private final String dataFilePath;

    private final AreaType type;

    private final ArrayList<Block> blocks = new ArrayList<Block>();

    public Area(String fileName, AreaType type) {
        this.dataFilePath = dataFileDir + fileName;
        this.type = type;
    }

    public String getDataFilePath() {
        return dataFilePath;
    }

    public AreaType getType() {
        return type;
    }

    public ArrayList<Block> getBlocks() {
        return blocks;
    }
}

public static enum AreaType {
    GROUND_NOON, GROUND_NIGHT, UNDERGROUND, SEA, CASTLE
}

public class AreaManager {

    /* The list of area */
    public final Area ground11 = new Area("1-1_ground.ad", AreaType.GROUND_NOON);
    public final Area underground11 = new Area("1-1_underground.ad", AreaType.UNDERGROUND);

    /* Block size */
    public int blockWidth = 64;
    public int blockHeight = 64;

    public void drawArea(Area area) {
        AreaType areaType = area.getType();

        PImage background = (areaType == AreaType.GROUND_NOON || areaType == AreaType.SEA) ? textures.backgroundCyan : textures.backgroundBlack;

        // draw background of currnet area
        image(background, 0, 0, width, height);

        for (Block block : area.getBlocks()) {
            block.draw();
        }
    }

    // Load block data from area data file
    public void loadArea(Area area) {
        BufferedReader reader = createReader(area.getDataFilePath());
        String line = null;

        ArrayList<Block> blocks = area.getBlocks();

        // Block positions
        int x = 0;
        int y = 0;

        try {
            while ((line = reader.readLine()) != null) {
                for (String str : line.split("")) {
                    int blockType = parseInt(str);

                    Block tempBlock = null;

                    AreaType type = area.getType();

                    switch (blockType) {
                    case 0:
                        tempBlock = new BlockAir(x * blockWidth, y * blockHeight); // Air
                        break;
                    case 1:
                        if (type == AreaType.GROUND_NOON || type == AreaType.GROUND_NIGHT) {
                            tempBlock = new BlockGround(x * blockWidth, y * blockHeight); // Ground
                        } else {
                            tempBlock = new BlockGroundDark(x * blockWidth, y * blockHeight); // Dark Ground
                        }
                        break;
                    case 2:
                        if (type == AreaType.GROUND_NOON || type == AreaType.GROUND_NIGHT) {
                            tempBlock = new BlockBrick(x * blockWidth, y * blockHeight); // Brick
                        } else {
                            tempBlock = new BlockBrickDark(x * blockWidth, y * blockHeight); // Dark Brick
                        }
                        break;
                    case 3:
                        if (type == AreaType.GROUND_NOON || type == AreaType.GROUND_NIGHT) {
                            tempBlock = new BlockStair(x * blockWidth, y * blockHeight); // Stair Block
                        } else {
                            tempBlock = new BlockStairDark(x * blockWidth, y * blockHeight); // Dark Stair Block
                        }
                        break;
                    case 4:
                        tempBlock = new BlockQuestion(x * blockWidth, y * blockHeight); // Question Block
                        break;
                    default:
                        // Do nothing
                        break;
                    }
                    blocks.add(tempBlock);
                    x++;
                }
                x = 0;
                y++;
            }
        }
        catch (IOException e) {
            e.printStackTrace();
            line = null;
        }
    }
}
