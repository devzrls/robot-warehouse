# Robot Warehouse

A implementation of a warehouse robot control system using Ruby. The robot moves on a 10 by 10 grid and accepts directional commands.

## Commands

The robot accepts the following commands:
* N move north
* W move west
* E move east
* S move south

Commands are comma-separated: `N,E,S,W`

## Usage

### Interactive CLI
```bash
./bin/robot_warehouse
```

## Requirements

- Ruby 3.4.5

## Testing

```bash
bundle install
bundle exec rspec
```

## Examples

- `N,E,S,W` - Full square, returns to start
- `N,E,N,E,N,E,N,E` - From (0,0) to (4,4)

Robot stays within 10x10 boundaries.