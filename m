Subject: Re: [PATCH] arm-autonomy/documentation: Update arm-autonomy-quickstart.md with dependencies
To: meta-arm@lists.yoctoproject.org
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
X-Originating-Location: Austin, Texas, US (217.140.99.251)
X-Originating-Platform: Linux Firefox 80
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 23 Sep 2020 01:37:44 -0700
References: <20200923013743.GB19045@kudzu.us>
In-Reply-To: <20200923013743.GB19045@kudzu.us>
Message-ID: <13602.1600850264285939019@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="9G8RYrvfgvy3MM9zVeP0"

--9G8RYrvfgvy3MM9zVeP0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 06:37 PM, Jon Mason wrote:

>=20
> On Tue, Sep 22, 2020 at 01:53:18AM -0700, Diego Sueiro wrote:
>=20
>> On Tue, Sep 22, 2020 at 09:47 AM, Nathan Dunne wrote:
>>=20
>>=20
>>> Added dependencies on meta-kernel and meta-arm/meta-arm-toolchain laye=
rs
>>> to quick start guide instructions.
>>>=20
>>> Change-Id: I7d5a3c631ccdcc7a39b8003a958d5f68ecb606c7
>>> Issue-Id: SCM-1298
>>> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
>>> ---
>>=20
>> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
>=20
> Applied to master.
>=20
> Thanks,
> Jon

Thanks.

Could this patch be backported to dunfell please?

>=20
>=20
>=20
>>=20
>>> .../documentation/arm-autonomy-quickstart.md | 13 ++++++++++---
>>> 1 file changed, 10 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.m=
d
>>> b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
>>> index 2a457c1..eb02b3a 100644
>>> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
>>> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
>>> @@ -26,6 +26,7 @@ First you must download the Yocto layers needed:
>>> - [poky]( https://git.yoctoproject.org/poky )
>>> - [meta-virtualization]( https://git.yoctoproject.org/meta-virtualizat=
ion )
>>>=20
>>> - [meta-arm]( https://git.yoctoproject.org/meta-arm )
>>> + - [meta-kernel]( https://gitlab.com/openembedded/community/meta-kern=
el.git
>>> )
>>> - all other layers you might want to use
>>>=20
>>> For each of the downloaded layer make sure you checkout the release of
>>> Yocto
>>> @@ -56,8 +57,9 @@ Here are the main steps to create an arm-autonomy
>>> project:
>>> bitbake-layers add-layer $LAYERDIR_BASE/meta-poky
>>> $LAYERDIR_BASE/meta-yocto-bsp \
>>> $LAYERDIR_BASE/meta-openembedded/meta-oe
>>> $LAYERDIR_BASE/meta-openembedded/meta-python \
>>> $LAYERDIR_BASE/meta-openembedded/meta-filesystems
>>> $LAYERDIR_BASE/meta-openembedded/meta-networking \
>>> - $LAYERDIR_BASE/meta-virtualization
>>> $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
>>> - $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bs=
p
>>> + $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-kernel \
>>> + $LAYERDIR_BASE/meta-arm/meta-arm
>>> $LAYERDIR_BASE/meta-arm/meta-arm-toolchain \
>>> + $LAYERDIR_BASE/meta-arm/meta-arm-bsp
>>> $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
>>> ```
>>>=20
>>> Example of a `conf/bblayers.conf`:
>>> @@ -71,12 +73,17 @@ Here are the main steps to create an arm-autonomy
>>> project:
>>> /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
>>> /home/user/arm-autonomy/meta-openembedded/meta-networking \
>>> /home/user/arm-autonomy/meta-virtualization \
>>> - /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
>>> + /home/user/arm-autonomy/meta-kernel \
>>> /home/user/arm-autonomy/meta-arm/meta-arm \
>>> + /home/user/arm-autonomy/meta-arm/meta-arm-toolchain \
>>> /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
>>> + /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
>>> "
>>> ```
>>>=20
>>> + Be aware that changing the order may break some dependencies if edit=
ing
>>> the
>>> + config file manually.
>>> +
>>> Those steps will have to be done for each project you will have to cre=
ate.
>>>=20
>>>=20
>>> Host project
>>> --
>>> 2.17.1
>>=20
>>=20
>=20
>

--9G8RYrvfgvy3MM9zVeP0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 06:37 PM, Jon Mason wrote:<br />
<blockquote>On Tue, Sep 22, 2020 at 01:53:18AM -0700, Diego Sueiro wrote:<=
br />
<blockquote>On Tue, Sep 22, 2020 at 09:47 AM, Nathan Dunne wrote:<br /><br=
 />
<blockquote>Added dependencies on meta-kernel and meta-arm/meta-arm-toolch=
ain layers<br />to quick start guide instructions.<br /><br />Change-Id: I7=
d5a3c631ccdcc7a39b8003a958d5f68ecb606c7<br />Issue-Id: SCM-1298<br />Signed=
-off-by: Nathan Dunne &lt;Nathan.Dunne@arm.com&gt;<br />---</blockquote>
Reviewed-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;</blockquote>
Applied to master.<br /><br />Thanks,<br />Jon</blockquote>
Thanks.<br /><br />Could this patch be backported to dunfell please?<br />=
<br />
<blockquote><br />
<blockquote>
<blockquote>.../documentation/arm-autonomy-quickstart.md | 13 ++++++++++--=
-<br />1 file changed, 10 insertions(+), 3 deletions(-)<br /><br />diff --g=
it a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md<br />b/meta=
-arm-autonomy/documentation/arm-autonomy-quickstart.md<br />index 2a457c1..=
eb02b3a 100644<br />--- a/meta-arm-autonomy/documentation/arm-autonomy-quic=
kstart.md<br />+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstar=
t.md<br />@@ -26,6 +26,7 @@ First you must download the Yocto layers needed=
:<br />- [poky](<a href=3D"https://git.yoctoproject.org/poky" target=3D"_bl=
ank" rel=3D"noopener">https://git.yoctoproject.org/poky</a>)<br />- [meta-v=
irtualization](<a href=3D"https://git.yoctoproject.org/meta-virtualization"=
 target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.org/meta-virtu=
alization</a>)<br />- [meta-arm](<a href=3D"https://git.yoctoproject.org/me=
ta-arm" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.org/met=
a-arm</a>)<br />+ - [meta-kernel](<a href=3D"https://gitlab.com/openembedde=
d/community/meta-kernel.git" target=3D"_blank" rel=3D"noopener">https://git=
lab.com/openembedded/community/meta-kernel.git</a>)<br />- all other layers=
 you might want to use<br /><br />For each of the downloaded layer make sur=
e you checkout the release of Yocto<br />@@ -56,8 +57,9 @@ Here are the mai=
n steps to create an arm-autonomy project:<br />bitbake-layers add-layer $L=
AYERDIR_BASE/meta-poky<br />$LAYERDIR_BASE/meta-yocto-bsp \<br />$LAYERDIR_=
BASE/meta-openembedded/meta-oe<br />$LAYERDIR_BASE/meta-openembedded/meta-p=
ython \<br />$LAYERDIR_BASE/meta-openembedded/meta-filesystems<br />$LAYERD=
IR_BASE/meta-openembedded/meta-networking \<br />- $LAYERDIR_BASE/meta-virt=
ualization<br />$LAYERDIR_BASE/meta-arm/meta-arm-autonomy \<br />- $LAYERDI=
R_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bsp<br />+ $LAYER=
DIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-kernel \<br />+ $LAYERDIR_=
BASE/meta-arm/meta-arm<br />$LAYERDIR_BASE/meta-arm/meta-arm-toolchain \<br=
 />+ $LAYERDIR_BASE/meta-arm/meta-arm-bsp<br />$LAYERDIR_BASE/meta-arm/meta=
-arm-autonomy \<br />```<br /><br />Example of a `conf/bblayers.conf`:<br /=
>@@ -71,12 +73,17 @@ Here are the main steps to create an arm-autonomy proj=
ect:<br />/home/user/arm-autonomy/meta-openembedded/meta-filesystems \<br /=
>/home/user/arm-autonomy/meta-openembedded/meta-networking \<br />/home/use=
r/arm-autonomy/meta-virtualization \<br />- /home/user/arm-autonomy/meta-ar=
m/meta-arm-autonomy \<br />+ /home/user/arm-autonomy/meta-kernel \<br />/ho=
me/user/arm-autonomy/meta-arm/meta-arm \<br />+ /home/user/arm-autonomy/met=
a-arm/meta-arm-toolchain \<br />/home/user/arm-autonomy/meta-arm/meta-arm-b=
sp \<br />+ /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \<br />"<br =
/>```<br /><br />+ Be aware that changing the order may break some dependen=
cies if editing the<br />+ config file manually.<br />+<br />Those steps wi=
ll have to be done for each project you will have to create.<br /><br />Hos=
t project<br />-- <br />2.17.1</blockquote>
</blockquote>
</blockquote>

--9G8RYrvfgvy3MM9zVeP0--
