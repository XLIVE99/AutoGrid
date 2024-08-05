# AutoGrid
###### Version 1.3
AutoGrid is an autotile system for the GridMap node in the Godot Engine. AutoGrid works similar to the TileMap node.

## **Installation**
1. Copy the "addons/AutoGrid" folder to your "addons" folder in the project directory. If you don't have any "addons" folder you can create it.<br>
2. Set the AutoGrid as active in "Project>Project Settings>Plugins".<br>
![](images/enable_plugin.GIF)
## **Usage**
All AutoGrid settings are in the AutoGrid dock panel which is in same tab as the inspector panel.<br>
![](images/dock_panel.png)
### **Setting the bitmasks**
1. Set the scene as shown in [Creating a MeshLibrary](https://docs.godotengine.org/en/stable/tutorials/3d/using_gridmaps.html).<br>
2. Enable the "Edit Mode" from the AutoGrid panel then select a MeshInstance you want to create the bitmask of it.<br>
![](images/Edit_Button_Options.png)
3. You will see a button named "AutoGrid" on top of the scene panel.
   - Create Bitmask: Creates a bitmask for the selected MeshInstance.
   - Remove Bitmask: Deletes the bitmask of the selected MeshInstance.
   - Expand Bitmask: Expands the bitmasks.
   - Shrink Bitmask: Shrinks the bitmasks.
   - All Axises: Shows the full bitmask.
   - Y & Z Axises: Shows Y & Z axises of the bitmask (Global X).
   - X & Z Axises: Shows X & Z axises of the bitmask (Global Y).
   - X & Y Axises: Shows X & Y axises of the bitmask (Global Z).
   - Set Icon: Sets the icon for the AutoGrid tile to be created (Default is the first child of the scene, selected icon will be shown as blue transparent sphere).
4. After creating the bitmask you can simply paint it by clicking on white cubes, painted cubes will become red. Click on the cube again to disable it.<br>
![](images/Bitmask.png)
### **Creating autotile info**
After setting all the bitmasks. Click to "Create Autotile Info" button located in the AutoGrid panel. Then create MeshLibrary again and you are ready to go! The autotile system will work now.<br>

***Read "addons>AutoGrid>HELP.pdf" for more information***

### **Settings**
![](images/panel_inside.png)
- Autotile: Enables autotile system.
- Autotile Mode:
  - Full 3x3: Checks every corner for fit the perfect tile for that place (Same as tilemap).
  - Minimal 3x3: Checks the corners three by three (Same as tilemap).
- Autotile Axis: Limits the autotile check axis. Useful when gridmap uses multiple floors
  - All: Checks all directions to fit the tile.
  - Y & Z Axises: Checks only Y & Z Axises (up-down, forward-back).
  - X & Z Axises: Checks only X & Z axises (right-left, forward-back). Useful for top-down games.
  - X & Y Axises: Checks only X & Y axises (right-left, up-down). Same as 2D tilemap, useful for side-scroller games.
- Tile Normal Axis: Select the tile's facing direction. Changes autotile scan orientation.
  - X Axis: Tile's facing direction is global X axis.
  - Y Axis: Tile's facing direction is global Y axis. Useful for ground tiles.
  - Z Axis: Tile's facing direction is global Z axis. Useful for wall (or background) tiles.
- Edit Mode: Enables the bitmap edit button.
- Performance Mode: If enabled only checks for new tiles, do not check for repainted tiles (If map is too big, enabling this might increase the performance).
- Reload Autotile Info: Reloads the bitmasks value. (Will shown if Edit mode is enabled)
- Create Autotile Info: Creates the autotile file. (Will shown if Edit mode is enabled)
![](images/Performance_Mode.png)

## **Demo project**
Demo project is designed for ***only Y axis*** and ***minimal 3x3*** mode, make sure you selected "Minimal 3x3" from the "Autotile Mode" and "Only Y" from the "Autotile Axis".<br>
You can open the "Demo_Scene.tscn" and start painting. **For better visual you can rotate the tile to look upward by pressing "A".**
### **Resources used at demo**
- "Dungeon Tileset" by buch (https://opengameart.org/users/buch) is licensed under Creative Commons Attribution (https://creativecommons.org/publicdomain/zero/1.0/).

## **Limitations**
- AutoGrid doesn't provide extended MeshLibrary, therefore all limitations on the MeshLibrary will remain.
- You need to move your cursor to the scene while using edit mode shortcuts.
- Re-open the Godot Engine will set all the bitmasks as active (If no need to edit the bitmasks then you can ignore this). However, reloading the autotile info (if any available) will solve this.
- Since the GridMap node doesn't have a last edited cell variable, performance cost will increase with the cell count.
- Gridmap's selection operations don't work with the AutoGrid.
- AutoGrid uses global axis. Therefore rotated tiles doesn't change anything.
