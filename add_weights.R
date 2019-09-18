# add weights for gameweek
# end of last season slightly more relevant than halway through
# this season much more relevant (~150%) than last
# more recent gws this season slightly more relevant than earlier games

gws <- unique(fpl_all$gw)
gws <- sort(gws)
(weights <- exp(gws/250))
plot(weights)

fpl_all$weight <- exp(fpl_all$gw/250)
