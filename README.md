chef-cookbook-windowsupdates Cookbook
======================
Cookbook to schedule the download of Windows critical updates, and seperately install the downloaded Windows updates rebooting if necessary.

Requirements
------------

#### Cookbooks
- `Windows` - chef-cookbook-windowsupdates needs (an adjusted) Windows cookbook to function.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### chef-cookbook-windowsupdates::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['windowsupdate']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### chef-cookbook-windowsupdates::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `chef-cookbook-windowsupdates` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-cookbook-windowsupdates]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Yvonne Beumer
