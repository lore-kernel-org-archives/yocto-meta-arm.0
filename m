Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA89FC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:24:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.30171.1660749863446508217
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 08:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NbJTgfjT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 207C824000C;
	Wed, 17 Aug 2022 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660749861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HPLr6k8/f3lJ020Gh9TINY8TvTut8K1l05umo+hk4wk=;
	b=NbJTgfjTa1eau3iNhNAhtJegOKkB8nJHmxIWtBr9IwIWOguWovRrWCoOQJqnAFtiOVlrE1
	54aE0M30BwhoVw/sYDmuh+WoFTb5TDwf3iwYuhSII0tIMUSHfTRa9raCY2gHF6zwVMwyrR
	Y5O52DF11uxcIyu+bsTr5ukfyT83Um6z1lmokhOLu1Mpdeoja6PLW/6FuEobKrMSRNuwWp
	vOqosWwQ9wqzpiOhPdeT0oy6QvUgypukgpDD3NifNlcLOnp6C3jH4b1qQtlkg3wXONOiNX
	7GUraOMiy9FHaVgR7rkJC4D0fhT+du5ZFYIS6xym83eFLfZiJhlFfgxkNI7O5g==
Date: Wed, 17 Aug 2022 17:24:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>, Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, swat@lists.yoctoproject.org
Subject: binutils upgrade will break tf-a
Message-ID: <Yv0IJDV3IRFaYIJe@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Aug 2022 15:24:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3700

Hello,

The upgrade to binutils 2.39 seems to cause the faollowing build
failure:

| aarch64-poky-linux-ld -o /home/pokybuild/yocto-worker/meta-arm/build/buil=
d/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/=
bl2/bl2.elf --fatal-warnings -O1 --gc-sections    -Map=3D/home/pokybuild/yo=
cto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwa=
re-a/2.7.0-r0/build/fvp/debug/bl2/bl2.map --script /home/pokybuild/yocto-wo=
rker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2=
=2E7.0-r0/build/fvp/debug/bl2/bl2.ld /home/pokybuild/yocto-worker/meta-arm/=
build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/=
fvp/debug/bl2/build_message.o /home/pokybuild/yocto-worker/meta-arm/build/b=
uild/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/deb=
ug/bl2/bl2_arch_setup.o /home/pokybuild/yocto-worker/meta-arm/build/build/t=
mp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2=
/bl2_image_load_v2.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/=
work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl=
2_main.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_bas=
e-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/desc_image_loa=
d.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-pok=
y-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fdt_wrappers.o /hom=
e/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/=
trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tf_crc32.o /home/pokybuild/=
yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firm=
ware-a/2.7.0-r0/build/fvp/debug/bl2/uuid.o /home/pokybuild/yocto-worker/met=
a-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/=
build/fvp/debug/bl2/sp805.o /home/pokybuild/yocto-worker/meta-arm/build/bui=
ld/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug=
/bl2/tzc400.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fv=
p_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/v2m_flash=
=2Eo /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-po=
ky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/delay_timer.o /hom=
e/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/=
trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/generic_delay_timer.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/io_fip.o /home/pokybuild/yoc=
to-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwar=
e-a/2.7.0-r0/build/fvp/debug/bl2/io_memmap.o /home/pokybuild/yocto-worker/m=
eta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r=
0/build/fvp/debug/bl2/io_semihosting.o /home/pokybuild/yocto-worker/meta-ar=
m/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/buil=
d/fvp/debug/bl2/io_storage.o /home/pokybuild/yocto-worker/meta-arm/build/bu=
ild/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debu=
g/bl2/fconf.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fv=
p_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fconf_dyn=
_cfg_getter.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fv=
p_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/semihosti=
ng.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-po=
ky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/mem_region.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_bl2_setup.o /home/pokybu=
ild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-=
firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_err.o /home/pokybuild/yocto-wor=
ker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.=
7.0-r0/build/fvp/debug/bl2/fvp_io_storage.o /home/pokybuild/yocto-worker/me=
ta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0=
/build/fvp/debug/bl2/fvp_security.o /home/pokybuild/yocto-worker/meta-arm/b=
uild/build/tmp/work/fvp_base-poky-linux/trusted-firm
ware-a/2.7.0-r0/build/fvp/debug/bl2/arm_bl2_mem_params_desc.o /home/pokybui=
ld/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-f=
irmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_bl2_setup.o /home/pokybuild/yoct=
o-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware=
-a/2.7.0-r0/build/fvp/debug/bl2/arm_dyn_cfg.o /home/pokybuild/yocto-worker/=
meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-=
r0/build/fvp/debug/bl2/arm_dyn_cfg_helpers.o /home/pokybuild/yocto-worker/m=
eta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r=
0/build/fvp/debug/bl2/arm_err.o /home/pokybuild/yocto-worker/meta-arm/build=
/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/d=
ebug/bl2/arm_image_load.o /home/pokybuild/yocto-worker/meta-arm/build/build=
/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/b=
l2/arm_io_storage.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/w=
ork/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm=
_nor_psci_mem_protect.o /home/pokybuild/yocto-worker/meta-arm/build/build/t=
mp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2=
/arm_tzc400.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fv=
p_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_fconf=
_io.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-p=
oky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/bl_common.o /home=
/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/t=
rusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/tf_log.o /home/pokybuild/yoc=
to-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwar=
e-a/2.7.0-r0/build/fvp/debug/bl2/multi_console.o /home/pokybuild/yocto-work=
er/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7=
=2E0-r0/build/fvp/debug/bl2/plat_bl_common.o /home/pokybuild/yocto-worker/m=
eta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r=
0/build/fvp/debug/bl2/plat_log_common.o /home/pokybuild/yocto-worker/meta-a=
rm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bui=
ld/fvp/debug/bl2/plat_common.o /home/pokybuild/yocto-worker/meta-arm/build/=
build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/de=
bug/bl2/popcountdi2.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp=
/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/p=
opcountsi2.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp=
_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/backtrace.=
o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-=
linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/fvp_common.o /home/po=
kybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trus=
ted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_common.o /home/pokybuild/yo=
cto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwa=
re-a/2.7.0-r0/build/fvp/debug/bl2/arm_console.o /home/pokybuild/yocto-worke=
r/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.=
0-r0/build/fvp/debug/bl2/xlat_tables_arch.o /home/pokybuild/yocto-worker/me=
ta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0=
/build/fvp/debug/bl2/xlat_tables_context.o /home/pokybuild/yocto-worker/met=
a-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/=
build/fvp/debug/bl2/xlat_tables_core.o /home/pokybuild/yocto-worker/meta-ar=
m/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/buil=
d/fvp/debug/bl2/xlat_tables_utils.o /home/pokybuild/yocto-worker/meta-arm/b=
uild/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/f=
vp/debug/bl2/bl2_entrypoint.o /home/pokybuild/yocto-worker/meta-arm/build/b=
uild/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/deb=
ug/bl2/early_exceptions.o /home/pokybuild/yocto-worker/meta-arm/build/build=
/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/b=
l2/spinlock.o /home/pokybuild/yocto-worker/meta-
arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/bu=
ild/fvp/debug/bl2/semihosting_call.o /home/pokybuild/yocto-worker/meta-arm/=
build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/=
fvp/debug/bl2/platform_up_stack.o /home/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp=
/debug/bl2/debug.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/wo=
rk/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/cach=
e_helpers.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_=
base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/misc_helper=
s.o /home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-pok=
y-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/platform_helpers.o =
/home/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-li=
nux/trusted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/pl011_console.o /home/p=
okybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/tru=
sted-firmware-a/2.7.0-r0/build/fvp/debug/bl2/board_arm_helpers.o /home/poky=
build/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/truste=
d-firmware-a/2.7.0-r0/build/fvp/debug/bl2/arm_helpers.o /home/pokybuild/yoc=
to-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmwar=
e-a/2.7.0-r0/build/fvp/debug/bl2/enable_mmu.o -L/home/pokybuild/yocto-worke=
r/meta-arm/build/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.=
0-r0/build/fvp/debug/lib  -lfdt -lc
| aarch64-poky-linux-ld: warning: /home/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp=
/debug/bl2/bl2.elf has a LOAD segment with RWX permissions
| make: *** [Makefile:1290: /home/pokybuild/yocto-worker/meta-arm/build/bui=
ld/tmp/work/fvp_base-poky-linux/trusted-firmware-a/2.7.0-r0/build/fvp/debug=
/bl2/bl2.elf] Error 1


https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2832/ste=
ps/13/logs/stdio

This is not yet in master.

--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

