# Usage

Install `npm`and then install `grunt-cli`, `bower` using  `npm`:

```
npm install -g grunt-cli bower 
```

Ensure you are running the 4.4.5 version of node. You can check it by running:

```
node -v
```

If the version is different from 4.4.5 then please note down the current version( say $CURR_NODE_VER). You can quickly upgrade/downgrade by running the following:

``` 
sudo npm cache clean -f 
sudo npm install -g n
sudo n 4.4.5
```

Continue with the below process and once you are done with everything, you can move back to the earlier version of node by running:

```
sudo n $CURR_NODE_VER
```

## Installing Ruby

If you are on a Mac then Ruby comes pre-installed so you can skip the next step:

##### Only for non mac users
 - Install Ruby by downloading from [here](http://rubyinstaller.org/downloads/) or use Homebrew

## Installing compass:
For Mac OSX  > 10.11(El Capitan) run the following:

```
sudo gem install -n /usr/local/bin compass
```

For everyone else: 

```
sudo gem install compass
```

## Installing the node_modules required for grunt

`cd` into the repo and run

```
npm install 
```


## Serve it hot

Run `grunt serve` for a preview on `localhost:9000`.  If 9000 is busy then you can change the `SERVER_PORT` variable in the top of Gruntfile.js 


