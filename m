Subject: Re: [PATCH] arm-autonomy: add compatibility to dunfell
To: meta-arm@lists.yoctoproject.org
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Linux Firefox 71
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 01 May 2020 06:36:46 -0700
References: <69C72C7D-DE19-4122-ADE0-1E6C72E1C121@arm.com>
In-Reply-To: <69C72C7D-DE19-4122-ADE0-1E6C72E1C121@arm.com>
Message-ID: <21659.1588340206777593864@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 12:45 AM, Bertrand Marquis wrote:

>
>=20
>=20
> > On 24 Apr 2020, at 07:52, Diego Sueiro via lists.yoctoproject.org
> <diego.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
> >=20
> >> -----Original Message-----
> >> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.or=
g>
> >> On Behalf Of Vineeth Raveendran via lists.yoctoproject.org
> >> Sent: 24 April 2020 07:49
> >> To: meta-arm@lists.yoctoproject.org
> >> Cc: nd <nd@arm.com>
> >> Subject: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfel=
l
> >>=20
> >>    - Remove xen-base from image as it's included via
> >>      xenguest-manager rdepends
> >>    - Use xen-tools in xenguest-manager rdepends for the required
> >>      xen tools and use xen-base only for zeus as it was changed
> >>      in meta-virtualization.
> >>    - Move xen bbappend as recipe was renamed in meta-virtualization.
> >>=20
> >> Change-Id: I439bde0df2c0a16f529436b65f1a96af5a2981af
> >> Issue-Id: SCM-833
> >> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
> >=20
> > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> >=20
> >> ---
> >> meta-arm-autonomy/conf/layer.conf                            | 2 +-
> >> .../recipes-core/images/arm-autonomy-host-image-minimal.bb   | 1 -
> >> .../xen/{xen_4.%.bbappend =3D> xen_%.bbappend}                 | 0
> >> .../recipes-extended/xenguest/xenguest-manager.bb            | 5 ++++=
-
> >> 4 files changed, 5 insertions(+), 3 deletions(-)  rename meta-arm-
> >> autonomy/recipes-extended/xen/{xen_4.%.bbappend =3D> xen_%.bbappend}
> >> (100%)
> >>=20
> >> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-
> >> autonomy/conf/layer.conf
> >> index 19f24ad..de79bdf 100644
> >> --- a/meta-arm-autonomy/conf/layer.conf
> >> +++ b/meta-arm-autonomy/conf/layer.conf
> >> @@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy =3D " \
> >>    openembedded-layer \
> >>    virtualization-layer \
> >> "
> >> -LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus"
> >> +LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus dunfell"
> >>=20
> >> # We don't activate virtualization feature from meta-virtualization a=
s it=20
> #
> >> brings in lots of stuff we don't need. We need to disable the sanity =
check
> diff
> >> --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> >> image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-
> >> autonomy-host-image-minimal.bb
> >> index 978b58f..727abf2 100644
> >> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> >> minimal.bb
> >> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> >> image-mini
> >> +++ mal.bb
> >> @@ -39,7 +39,6 @@ IMAGE_INSTALL +=3D " \
> >>     packagegroup-core-boot \
> >>     packagegroup-core-ssh-openssh \
> >>     kernel-modules \
> >> -    xen-base \
> >>     qemu \
> >>     xenguest-manager \
> >>     xenguest-network-bridge \
> >> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
> >> b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> >> similarity index 100%
> >> rename from meta-arm-autonomy/recipes-
> >> extended/xen/xen_4.%.bbappend
> >> rename to meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> >> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> >> manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> >> manager.bb
> >> index 9affae9..2e040a8 100644
> >> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> >> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> >> manager.bb
> >> @@ -46,7 +46,10 @@ do_install() {
> >> }
> >>=20
> >> # Things that we need on the target
> >> -RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-xl parted
> >> e2fsprogs"
> >> +RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 parted e2fsprogs=
"
> >> +
> >> +# Extend RDEPENDS based on the yocto version we are running against
> >> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('LAYERSERIES_CORENAMES',
> >> 'zeus', 'xen-base', 'xen-tools', d)}"
> >>=20
> >> FILES_${PN} +=3D "${bindir}/xenguest-manager \
> >>                ${sysconfdir}/xenguest"
> >> --
> >> 2.17.1
> >=20
> >=20
>=20
>

Abandoning patch to rework on the same.

Thanks,

Vineeth
