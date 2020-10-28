Subject: Re: [PATCH 2/2] arm-autonomy/xenguest-network: add kea dhcp4 configuration
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 28 Oct 2020 06:04:58 -0700
References: <20201028110716.22544-2-kamil.dziezyk@arm.com>
In-Reply-To: <20201028110716.22544-2-kamil.dziezyk@arm.com>
Message-ID: <13533.1603890298341015472@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 11:09 AM, Kamil Dziezyk wrote:

>
> Since dhcp-server was removed from oe-core layer,
> we decided to add kea dhcp support in meta-arm-autonomy.
>=20
> This patch introduce following changes:
>   (*) replaces all configuration and customization valid for dhcpd,
>       with kea complatible one.
>   (*) replaces dhcp-server rdependency with kea for xenguest-network rec=
ipe
>   (*) replaces default kea dhcp4 server configuration with a minimal one=
.
>=20
> Change-Id: I4202b5b8f3be6801cbb4f9068061eccfdadee5f0
> Issue-Id: SCM-1522
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../classes/xenguest-image.bbclass            |   2 +-
>  .../documentation/xenguest-network.md         |  24 +++--
>  .../0002-vif-nat-fix-symlink-removal.patch    |  45 --------
>  .../recipes-extended/xen/xen-tools_%.bbappend |   1 -
>  .../xenguest/files/00-vif-xenguest.hook       | 102 ++++++++----------
>  .../xenguest/files/dhcpd-params.cfg           |  30 ------
>  .../xenguest/files/kea-dhcp4.conf             |  30 ++++++
>  .../xenguest/files/kea-restore-default-config |  29 +++++
>  .../xenguest/files/kea-subnet4.json           |  35 ++++++
>  .../xenguest/files/network-bridge.sh.in       |  10 --
>  .../files/xenguest-network-init-post.sh       |  45 ++++++++
>  .../xenguest/xenguest-base-image.bb           |   9 +-
>  .../xenguest/xenguest-network.bb              |  33 +++++-
>  13 files changed, 235 insertions(+), 160 deletions(-)
>  delete mode 100644
> meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlin=
k-removal.patch
>  delete mode 100644
> meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
>  create mode 100644
> meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
>  create mode 100755
> meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-co=
nfig
>  create mode 100644
> meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
>  create mode 100755
> meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-=
post.sh
>=20
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass
> b/meta-arm-autonomy/classes/xenguest-image.bbclass
> index be1dde5..93f6578 100644
> --- a/meta-arm-autonomy/classes/xenguest-image.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
> @@ -62,7 +62,7 @@ XENGUEST_IMAGE_DISK_PARTITIONS ??=3D
> "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.ta
>  # The "bridge" type will share the physical eth interface from dom0 wit=
h the
>  # domU. This will allow the domU to have access to the external network=
.
>  # The "nat" type will setup a virtual network between dom0 and domU and=
 also
> -# configure and run the dhcpd on dom0 to serve the domU.
> +# configure and run the kea dhcp4 server on dom0 to serve the domU.
>  # The "none" type will not affect any networking setting between on dom=
0 and
>  # domU.
>  XENGUEST_IMAGE_NETWORK_TYPE ??=3D "bridge"
> diff --git a/meta-arm-autonomy/documentation/xenguest-network.md
> b/meta-arm-autonomy/documentation/xenguest-network.md
> index b731f3e..dad2698 100644
> --- a/meta-arm-autonomy/documentation/xenguest-network.md
> +++ b/meta-arm-autonomy/documentation/xenguest-network.md
> @@ -12,9 +12,10 @@ At the moment 3 types of network arrangements are pro=
vided:
>  
>  - Bridge: where the guest vif is added to the created bridge interface;
>  
> -- NAT: where a private subnet is created for the guest, a dhcpd is star=
ted on
> -  the host to serve the guest and the proper iptables rules are created=
 to
> -  allow the guest to access the external network;
> +- NAT: where a private subnet is created for the guest,
> +  a kea dhcp4 server is started on the host to serve the guest
> +  and the proper iptables rules are created
> +  to allow the guest to access the external network;
>  
>  - None: the guest vif is not connected to the bridge.
>  
> @@ -55,17 +56,20 @@ The following parameters are available:
>    contains the dom0 physical interface giving the guest direct access t=
o the
>    external network.
>    The **nat** type will setup a private network between dom0 and domU, =
setup
> -  the appropriate routing table, configure and run the dhcpd on dom0 to=
 serve
> -  the domU and apply the iptables rules to allow the guest to acess the
> -  external network. The dhcpd configuration for the guest can be custom=
ised
> by
> -  replacing the
> -  "meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg" =
file
> -  in a xenguest-network.bbappend. The dhcpd-params.cfg file is installe=
d in
> +  the appropriate routing table, configure and run the kea dhcp4 server
> +  on dom0 to serve the domU and apply the iptables rules to allow the g=
uest
> +  to acess the external network. The kea dhcp4 server configuration for
> +  the guest can be customised by replacing the
> +  "meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json" =
file
> +  in a xenguest-network.bbappend. The kea-subnet4.json file is installe=
d in
>    the xenguest image and copied to
> -  "/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg" when the g=
uest
> +  "/etc/xenguest/guests/${guestname}/files/kea-subnet4.json" when the g=
uest
>    image is created. It will be consumed by the
>    "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is ca=
lled
> by
>    "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest=
.
> +  After guest start, "/etc/xenguest/init.post/xenguest-network-init-pos=
t.sh"
> +  script is called to reload kea dhcp4 server with updated configuratio=
n,
> +  after virtual network interface is ready.
>    In the guest project, the NAT port forward can be customised by chang=
ing
>    the XENGUEST_IMAGE_HOST_PORT (default: "1000 + ${domid}") and
>    XENGUEST_IMAGE_GUEST_PORT (default: "22") variables in local.conf or
> diff --git
> b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-syml=
ink-removal.patch
> deleted file mode 100644
> index bcd5778..0000000
> ---
> a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-syml=
ink-removal.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Upstream-Status: Pending
> -Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> -
> -Copy temp files used to add/remove dhcpd configurations to avoid
> -replacing potential symlinks.
> -
> -Index: git/tools/hotplug/Linux/vif-nat
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/tools/hotplug/Linux/vif-nat
> -+++ git/tools/hotplug/Linux/vif-nat
> -@@ -99,7 +100,8 @@ dhcparg_remove_entry()
> -   then
> -     rm "$tmpfile"
> -   else
> --    mv "$tmpfile" "$dhcpd_arg_file"
> -+    cp "$tmpfile" "$dhcpd_arg_file"
> -+    rm "$tmpfile"
> -   fi
> - }
> -=20
> -@@ -109,11 +111,11 @@ dhcparg_add_entry()
> -   local tmpfile=3D$(mktemp)
> -   # handle Red Hat, SUSE, and Debian styles, with or without quotes
> -   sed -e 's/^DHCPDARGS=3D"*\([^"]*\)"*/DHCPDARGS=3D"\1'"${dev} "'"/' \
> --     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> -+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> -   sed -e 's/^DHCPD_INTERFACE=3D"*\([^"]*\)"*/DHCPD_INTERFACE=3D"\1'"${=
dev} "'"/'
> \
> --     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> -+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> -   sed -e 's/^INTERFACES=3D"*\([^"]*\)"*/INTERFACES=3D"\1'"${dev} "'"/'=
 \
> --     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> -+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
> -   rm -f "$tmpfile"
> - }
> -=20
> -@@ -125,7 +127,8 @@ dhcp_remove_entry()
> -   then
> -     rm "$tmpfile"
> -   else
> --    mv "$tmpfile" "$dhcpd_conf_file"
> -+    cp "$tmpfile" "$dhcpd_conf_file"
> -+    rm "$tmpfile"
> -   fi
> -   dhcparg_remove_entry
> - }
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> index 45739ff..51e0dfa 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> @@ -1,7 +1,6 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>  
>  SRC_URI +=3D "file://0001-vif-nat-fix-hostname.patch \
> -            file://0002-vif-nat-fix-symlink-removal.patch \
>             "
>  
>  PACKAGECONFIG_remove =3D "\
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
> b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
> index 7a2fb6f..37ecec0 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.=
hook
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.=
hook
> @@ -18,6 +18,8 @@
>  domid=3D$(xenstore_read "${XENBUS_PATH}/frontend-id")
>  guestname=3D$(xenstore_read "/local/domain/${domid}/name")
>  bridge=3D$(xenstore_read "${XENBUS_PATH}/bridge")
> +mac=3D$(xenstore_read "$XENBUS_PATH/mac")
> +kea_conf_file=3D"/etc/kea/kea-dhcp4.conf"
>  
>  if [ ! -f /etc/xenguest/guests/${guestname}/params.cfg ]; then
>      log debug "No /etc/xenguest/guests/${guestname}/params.cfg. Exiting=
."
> @@ -36,63 +38,48 @@ get_subnet_prefix() {
>  
>  subnetprefix=3D$(get_subnet_prefix)
>  
> -dhcpd_remove_conf_entry()
> +kea_remove_conf_entry()
>  {
> -    local tmpfile=3D$(mktemp)
> -
> -    # Remove the the xenguest dhcpd config file inclusion in the dhcpd
> -    # main config
> -    grep -v "include \"${XENGUEST_DHCPD_CONF_FILE}\";" \
> -            "${dhcpd_conf_file}" >"${tmpfile}"
> -    if ! diff "${tmpfile}" "${dhcpd_conf_file}" >/dev/null
> -    then
> -        cp "${tmpfile}" "${dhcpd_conf_file}"
> -    fi
> -    rm ${tmpfile}
> -
> -    # Remove the generated the xenguest dhcpd file
> -    rm ${XENGUEST_DHCPD_CONF_FILE}
> -}
> +    log debug "kea_remove_conf_entry"
> +    claim_lock "vif-nat-kea"
>  
> -# This function removes the dhcpd options added by the vif-nat script a=
nd
> -# adds the user provided options under the ${XENGUEST_DHCPD_HOST_OPTION=
S}
> -# variable set in "/etc/xenguest/guests/${guestname}/files/dhcpd-params=
.cfg"
> -# file.
> -dhcpd_add_conf_entries()
> -{
> -    # We need to remove the previous added entry from vif-nat script
> -    dhcp_remove_entry
> +    # Remove the the xenguest kea config file inclusion in the kea main
> config
> +    sed -i "/${kea_guest_config//'/'/'\/'}/d" "${kea_conf_file}"
>  
> -    # Include the xenguest dhcpd config file in the dhcpd main config
> -    echo >>"${dhcpd_conf_file}" "include \"${XENGUEST_DHCPD_CONF_FILE}\=
";"
> +    # Remove interface entry 1st case: [ "dev1", "dev_to_remove" ]
> +    sed -i "s/,\ \"$dev\"//" "${kea_conf_file}"
> +    # Remove interface entry 2nd case: [ "dev_to_remove", "dev1" ]
> +    sed -i "s/\"$dev\",\ //" "${kea_conf_file}"
> +    # Remove interface entry 3rd case: [ "dev_to_remove" ]
> +    sed -i "s/\[\ \"$dev\"\ \]/\[\ \]/" "${kea_conf_file}"
>  
> -    # Generate the xenguest dhcpd file
> -    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_DHCPD_PARAMS_FILE})\"")=
" \
> -            >> "${XENGUEST_DHCPD_CONF_FILE}"
> +    # Remove the generated the xenguest kea subnet conf file
> +    rm ${XENGUEST_KEA_SUBNET_CONFIG}
>  
> -    # Re-add the dhcpargs entries removed by dhcp_remove_entry call
> -    dhcparg_add_entry
> -}
> +    keactrl reload
>  
> -dhcpd_online(){
> -    log debug "dhcpd_online"
> -    claim_lock "vif-nat-dhcp"
> -    dhcpd_add_conf_entries
> -    release_lock "vif-nat-dhcp"
> -   "$dhcpd_init_file" restart || true
> +    release_lock "vif-nat-kea"
>  }
>  
> -dhcpd_offline(){
> -    log debug "dhcpd_offline"
> -    claim_lock "vif-nat-dhcp"
> -    dhcpd_remove_conf_entry
> -    release_lock "vif-nat-dhcp"
> -    "$dhcpd_init_file" restart || true # We need to ignore failure beca=
use
> -                                       # ISC dhcpd 3 borks if there is
> nothing
> -                                       # for it to do, which is the cas=
e if
> -                                       # the outgoing interface is not
> -                                       # configured to offer leases and=
 there
> -                                       # are no vifs.
> +kea_add_conf_entries()
> +{
> +    log debug "kea_add_conf_entries"
> +    claim_lock "vif-nat-kea"
> +
> +    # Include vif in the interfaces 1st case - no other entries:
> +    search_for=3D'\"interfaces\": \[ '
> +    sed -i "/${search_for}\"*\"\ */ s/\ \]/,\ \"${dev}\"\ \]/g"
> "${kea_conf_file}"
> +    sed -i "s/${search_for}]/${search_for}\"${dev}\"\ \]/g"
> "${kea_conf_file}"
> +
> +    # Include the xenguest kea subnet conf file in the kea main config
> +    search_for=3D'\"subnet4\": \['
> +    sed -i "/$search_for/a $kea_guest_config" "${kea_conf_file}"
> +
> +    # Generate the xenguest kea subnet conf file
> +    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_KEA_SUBNET_TEMPLATE})\"=
")" \
> +            > "${XENGUEST_KEA_SUBNET_CONFIG}"
> +
> +    release_lock "vif-nat-kea"
>  }
>  
>  call_extra_hooks() {
> @@ -111,24 +98,29 @@ call_extra_hooks() {
>  
>  case "${XENGUEST_NETWORK_TYPE}" in
>      nat)
> -      =20
> XENGUEST_DHCPD_PARAMS_FILE=3D${XENGUEST_DHCPD_PARAMS_FILE:-"/etc/xengues=
t/guests/${guestname}/files/dhcpd-params.cfg"}
> -        if [ ! -f ${XENGUEST_DHCPD_PARAMS_FILE} ]; then
> -            log debug "No ${XENGUEST_DHCPD_PARAMS_FILE} file. Aborting"
> +      =20
> XENGUEST_KEA_SUBNET_TEMPLATE=3D${XENGUEST_KEA_SUBNET_TEMPLATE:-"/etc/xen=
guest/guests/${guestname}/files/kea-subnet4.json"}
> +        if [ ! -f ${XENGUEST_KEA_SUBNET_TEMPLATE} ]; then
> +            log debug "No ${XENGUEST_KEA_SUBNET_TEMPLATE} file. Abortin=
g"
>              return
>          fi
>  
> -        XENGUEST_DHCPD_CONF_FILE=3D"/etc/dhcp/dhcpd.dom$domid.conf"
> +        XENGUEST_KEA_SUBNET_CONFIG=3D"/etc/kea/kea-subnet4.dom$domid.js=
on"
> +        if [ ! -d "$(dirname ${XENGUEST_KEA_SUBNET_CONFIG})" ]; then
> +            log debug "No kea configuration directory. Aborting"
> +            return
> +        fi
> +        kea_guest_config=3D"\ \ \ \ <?include
> \"${XENGUEST_KEA_SUBNET_CONFIG}\"?>"
>  
>          case "$command" in
>              online)
> -                dhcpd_online
> +                kea_add_conf_entries
>  
>                  # Enable ip forwarding and NAT for the ${bridge} interf=
ace
>                  sysctl -w net.ipv4.ip_forward=3D1
>                  iptables_w -t nat -A POSTROUTING -o ${bridge} -j MASQUE=
RADE
> -m comment --comment "dom${domid}"
>                  ;;
>              offline)
> -                dhcpd_offline
> +                kea_remove_conf_entry
>  
>                  # Remove the NAT iptables rules created for the dom${do=
mid}
>                  guest_ipt_rule=3D$(iptables_w -t nat -vL POSTROUTING -n
> --line-number | grep -w dom${domid} | awk '{print $1}' | tac)
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
> b/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
> deleted file mode 100644
> index 0495fbd..0000000
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -# This file holds the guest dhcpd options running on Dom0.
> -# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the =
end of
> -# the vif-nat script will use this file to generate the final dhcpd
> -# configuration.
> -
> -# This file is added in the xenguest image and installed in dom0 under
> -# /etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg when the gue=
st
> -# image is created.
> -# Any customizations to it should be performed by replacing it via a
> bbappend.
> -
> -# The \${hostname}, \${mac}, \${vif_ip} and \${router_ip} variables are=
 set
> in
> -# the vif-nat script context. The \${subnetprefix} variable is set in t=
he
> -# 00-vif-xenguest.hook script context.
> -
> -# The "subnet" configuration node is mandatory in order to have the dhc=
pd
> -# properly running.
> -
> -host ${hostname} {
> -    hardware ethernet ${mac};
> -    fixed-address ${vif_ip};
> -    option routers ${router_ip};
> -    option subnet-mask 255.255.255.0;
> -    option broadcast-address ${subnetprefix}.255;
> -    option domain-name-servers 8.8.8.8;
> -    option host-name \"${hostname}\";
> -    option domain-name \"example.com\";
> -}
> -
> -subnet ${subnetprefix}.0 netmask 255.255.255.0 {
> -}
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4=
.conf
> b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
> new file mode 100644
> index 0000000..0a1cc6a
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
> @@ -0,0 +1,30 @@
> +# This file holds the minimal kea dhcp4 server configuration.
> +# It replaces existing kea dhcp configuration file via
> +# "/etc/init.d/kea-restore-default-config" on every system boot.
> +# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the =
end of
> +# the vif-nat script will append each xenguest configuration to this fi=
le,
> +# to generate the final dhcp configuration.
> +# This file can be replaced with xenguest-network.bbappend.
> +{
> +"Dhcp4": {
> +    "interfaces-config": {
> +        "interfaces": [ ]
> +    },
> +    "lease-database": {
> +        "type": "memfile",
> +        "persist": false
> +    },
> +    "subnet4": [
> +        {
> +            "subnet": "192.0.2.0/24"
> +        }
> +    ],
> +    "loggers": [
> +        {
> +            "name": "kea-dhcp4",
> +            "output_options": [ { "output": "/var/log/kea-dhcp4.log" } =
],
> +            "severity": "INFO"
> +        }
> +    ]
> +}
> +}
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-=
config
> b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-=
config
> new file mode 100755
> index 0000000..424fd0a
> --- /dev/null
> +++
> b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-=
config
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +#
> +# Xenguest Restore default kea dhcp4 configuration
> +# This script restores a dhcp4 server configuration, to prevent
> +# kea startup failures after random board hangs or powercuts.
> +#
> +
> +case "$1" in
> +  start)
> +        ret=3D$(keactrl status | grep -i "dhcpv4 server" | cut -d ' ' -=
f 3)
> +        if [ "$ret" =3D "active" ]; then
> +            echo "WARNING: cowardly refusing to replace dhcp4 configura=
tion"
> +            echo "kea dhcp4 server is up and running!"
> +        else
> +            echo "Resetting kea dhcp4 configuration."
> +            cp -f /etc/kea/kea-dhcp4.conf.original /etc/kea/kea-dhcp4.c=
onf
> +        fi
> +        ;;
> +  status|stop|reload|force-reload|restart)
> +        true
> +        ;;
> +  *)
> +        # do not advertise unreasonable commands that there is no reaso=
n
> +        # to use with this device
> +        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
> +        exit 1
> +esac
> +
> +exit $?
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
> b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
> new file mode 100644
> index 0000000..9dacbb1
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
> @@ -0,0 +1,35 @@
> +# This file holds the guest kea dhcp4 server options running on Dom0.
> +# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the =
end of
> +# the vif-nat script will use this file to generate the final dhcp
> +# configuration.
> +
> +# This file is added in the xenguest image and installed in dom0 under
> +# /etc/xenguest/guests/${guestname}/files/kea-subnet4.json when the gue=
st
> +# image is created.
> +# Any customizations to it should be performed by replacing it via a
> bbappend.
> +
> +# The \${vif_ip} and \${router_ip} variables are set in
> +# the vif-nat script context. The \${subnetprefix} and \${mac} variable=
 are
> set in the
> +# 00-vif-xenguest.hook script context.
> +
> +# The "subnet" configuration node is mandatory in order to have the dhc=
p
> +# properly running.
> +        {
> +            \"subnet\": \"${subnetprefix}.0/24\",
> +            \"option-data\": [
> +                {
> +                    \"name\": \"routers\",
> +                    \"data\": \"${router_ip}\"
> +                },
> +                {
> +                    \"name\": \"domain-name-servers\",
> +                    \"data\": \"8.8.8.8, 8.8.4.4\"
> +                }
> +            ],
> +            \"reservations\": [
> +                {
> +                    \"hw-address\": \"${mac}\",
> +                    \"ip-address\": \"${vif_ip}\"
> +                }
> +            ]
> +        },
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> index 27306e4..46d230e 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.s=
h.in
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.s=
h.in
> @@ -10,16 +10,6 @@ BRIDGE_NAME=3D"###BRIDGE_NAME###"
>  
>  case "${XENGUEST_NETWORK_TYPE:-}" in
>      nat)
> -        # Create the symlinks for the files that vif-nat script expects
> -        if [ ! -f /etc/dhcpd.conf ]; then
> -            ln -s dhcp/dhcpd.conf /etc/dhcpd.conf
> -        fi
> -        if [ ! -f /etc/init.d/dhcp3-server ]; then
> -            ln -s dhcp-server /etc/init.d/dhcp3-server
> -        fi
> -        if [ ! -f /etc/default/dhcp3-server ]; then
> -            ln -s dhcp-server /etc/default/dhcp3-server
> -        fi
>          echo "vif =3D ['script=3Dvif-nat']" >> ${guestcfgfile}
>          ;;
>      bridge)
> diff --git
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-ini=
t-post.sh
> new file mode 100755
> index 0000000..aa43ce8
> --- /dev/null
> +++
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-ini=
t-post.sh
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +# This script is to reload kea dhcp4 server when guest interface will b=
e
> ready
> +
> +# include locking functions
> +. /etc/xen/scripts/locking.sh
> +set +u
> +
> +# $1 is vif name, e.g. "vif/15/0"
> +# returns 0 on success,
> +# 1 otherwize
> +#
> +
> +check_if_vif_is_ready() {
> +    ret=3D($(xl network-list "${guestname}" | grep  "${1}"))
> +    # ${ret[4]} is network interface status value
> +    # 1 means vif is not ready
> +    # 4 means vif is ready
> +    [ "${ret[4]}" =3D "4" ] && return 0
> +    return 1
> +}
> +
> +case "${XENGUEST_NETWORK_TYPE:-}" in
> +    nat)
> +        vif_name=3D"$(xl network-list ${guestname} | grep -o vif.*)"
> +
> +        for try in {1..20}
> +        do
> +            if check_if_vif_is_ready "${vif_name}"; then
> +                claim_lock "vif-nat-kea"
> +                keactrl reload
> +                release_lock "vif-nat-kea"
> +                exit 0
> +            fi
> +            echo "Waiting for ${vif_name} - network interface is not
> ready..."\
> +                 " try #${try}" >> "${LOGFILE}" 2>&1
> +            sleep 1
> +        done
> +        echo "ERROR: Failed to get ${vif_name} "\
> +             "network interface ready!" >> "${LOGFILE}" 2>&1
> +        exit 1
> +        ;;
> +    *)
> +        echo "No action needed" >> "${LOGFILE}" 2>&1
> +        ;;
> +esac
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> index d164a81..4cc96aa 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> @@ -47,12 +47,13 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??=3D ""
>  # Add xen files
>  # Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES =
should
>  # be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.
> -# The dhcpd-params.cfg holds the dhcpd configuration for Dom0. And it i=
s used
> -# when XENGUEST_IMAGE_NETWORK_TYPE=3D"nat". Any customizations to it sh=
ould be
> -# performed by replacing it via a xenguest-network.bbappend.
> +# The kea-subnet4.json holds the kea dhcp4 subnet configuration for Dom=
0.
> +# And it is used when XENGUEST_IMAGE_NETWORK_TYPE=3D"nat".
> +# Any customizations to it should be performed by replacing it
> +# via a xenguest-network.bbappend.
>  # The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT file is only added if the
>  # variable is set.
> -XENGUEST_IMAGE_SRC_URI_XEN_FILES =3D "file://dhcpd-params.cfg \
> +XENGUEST_IMAGE_SRC_URI_XEN_FILES =3D "file://kea-subnet4.json \
>      ${@ "file://" + d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') =
\
>        if d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') else "" } \
>      "
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-networ=
k.bb
> b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> index 6442687..d0517b6 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> @@ -21,12 +21,22 @@ SRC_URI =3D " \
>      file://xenguest-network-bridge-dhcp.cfg.in \
>      file://network-bridge.sh.in \
>      file://00-vif-xenguest.hook \
> +    file://xenguest-network-init-post.sh \
> +    file://kea-dhcp4.conf \
> +    file://kea-restore-default-config \
>      "
> +PACKAGES =3D+ "${PN}-kea-dhcp4"
>  
>  # Bridge configurator needs to run before S01networking init script
>  # Prefix with a_ to make sure it is executed in runlevel 01 before othe=
rs
> -INITSCRIPT_NAME =3D "a_xenguest-network-bridge"
> -INITSCRIPT_PARAMS =3D "defaults 01"
> +INITSCRIPT_PACKAGES =3D "${PN} ${PN}-kea-dhcp4"
> +INITSCRIPT_NAME_${PN} =3D "a_xenguest-network-bridge"
> +INITSCRIPT_PARAMS_${PN} =3D "defaults 01"
> +
> +# Kea configuration needs to be restored before kea init scripts:
> +# Kea dhcp4 server is 30, so lets use 20, to have higher priority
> +INITSCRIPT_NAME_${PN}-kea-dhcp4 =3D "kea-restore-default-config"
> +INITSCRIPT_PARAMS_${PN}-kea-dhcp4 =3D "defaults 20"
>  
>  inherit update-rc.d
>  
> @@ -43,7 +53,7 @@ do_install() {
>         > ${WORKDIR}/network-bridge.sh
>      install -d -m 755 ${D}${sysconfdir}/init.d
>      install -m 755 ${WORKDIR}/xenguest-network-bridge \
> -        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}}
>      install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
>      install -m 755 ${WORKDIR}/xenguest-network-bridge.cfg \
>          ${D}${sysconfdir}/network/interfaces.d/.
> @@ -54,11 +64,22 @@ do_install() {
>      install -d ${D}${sysconfdir}/xen/scripts/vif-post.d
>      install -m 755 ${WORKDIR}/00-vif-xenguest.hook \
>          ${D}${sysconfdir}/xen/scripts/vif-post.d/.
> +
> +    install -d -m 755 ${D}${sysconfdir}/xenguest/init.post
> +    install -m 755 ${WORKDIR}/xenguest-network-init-post.sh \
> +        ${D}${sysconfdir}/xenguest/init.post/.
> +
> +    install -m 755 ${WORKDIR}/kea-restore-default-config \
> +        ${D}${sysconfdir}/init.d/.
> +    install -d -m 755 ${D}${sysconfdir}/kea/
> +    install -m 755 ${WORKDIR}/kea-dhcp4.conf \
> +        ${D}${sysconfdir}/kea/kea-dhcp4.conf.original
>  }
>  
>  RDEPENDS_${PN} +=3D "bridge-utils \
>                     iptables \
> -                   dhcp-server \
> +                   kea \
> +                   ${PN}-kea-dhcp4 \
>                     kernel-module-xt-tcpudp \
>                     kernel-module-xt-physdev \
>                     kernel-module-xt-comment \
> @@ -68,3 +89,7 @@ RDEPENDS_${PN} +=3D "bridge-utils \
>  FILES_${PN} +=3D
> "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
>  FILES_${PN} +=3D "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
>  FILES_${PN} +=3D "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.=
hook"
> +
> +FILES_${PN}-kea-dhcp4 =3D "${sysconfdir}/kea/kea-dhcp4.conf.original"
> +FILES_${PN}-kea-dhcp4 +=3D
> "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
> +FILES_${PN}-kea-dhcp4 +=3D
> "${sysconfdir}/xenguest/init.post/xenguest-network-init-post.sh"
> --=20
> 2.17.1
>=20
>
