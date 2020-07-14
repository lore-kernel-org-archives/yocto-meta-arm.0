Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.18494.1594729389441973554
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=i679Feu+;
 spf=pass (domain: burtonini.com, ip: 209.85.128.68, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f68.google.com with SMTP id f18so5474173wml.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=glxzMFf5fkcJzeT45GUn8O/fj3dqgPWB8TeKtAIcj0c=;
        b=i679Feu+da/SXZlCJneNpNG9NY2OIp6w+dBaBbB5pfXk/WmNingLAw+C+BAtzBhzoc
         ooX5rEiQgLYG/Ggq7MBdoL4YJGcSLS+tdJVCwv8/qL645HdBtQPG4YAIMPTWZAgDw/WQ
         WrvttWL3TeqWLhWD38pwiGjH9VtghNiX7T1Ho8f4HSmm0ijCT3oa419Tihq2do0a5Z95
         OeoTQ+lDEpUEqXKSXZLLKA9U0YMTuuQuT54q3bbpp5Dn+TPLS4ZOOzNahjO4PCQLK3i2
         gCqIfm6Nj7Ywjug4M6r7RTRiOM1/0hwQoCKQew2TiE9iBtGajwjlib8+MO12q7Pc8C7h
         7+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=glxzMFf5fkcJzeT45GUn8O/fj3dqgPWB8TeKtAIcj0c=;
        b=oygzXO2mkPBNZTj/Y7/aQUFUlj1Nnjs+c2I/a4WaDSYlB1wGM3rZPrTWkyn7IxgeEV
         Ok6DXUtWnyKRGsChzJgREcDNPysZQvxn/qE4vuC2SqT+EKnT3zucjaDtUmbM5Wslfe8d
         /03nL7F2XH2OzdUv+USZNcqnUnqtFrip3fyb6gf7aofjAc0pellUwhdIcYRF7lFQHItH
         ENrx50XCBsyBCAFXKCQTCmqAHghtHRt6LXkeG98/fESlqP8yMGwHTPzD0u16OVjt6sEV
         LpZ3lGIAzYPNPF/DefVvYa7otBqgKpB9yEbWmA37pJTN0TGN+dSULIX8TbG6Hob0UC13
         wI7g==
X-Gm-Message-State: AOAM5329kbT61NC1YGth1FkwrS7mIySH3MqZLs54TVKrDfYg3psKqocR
	+sqvs0k3O9mOym1w5hQz075ZYja3Jvo=
X-Google-Smtp-Source: ABdhPJwWtghszA8i98+QPEv+P1W/AvaSzz0y6uP73Hls4VJixuNRoWscrEfxX3vGowTcNmW++59Emw==
X-Received: by 2002:a7b:c403:: with SMTP id k3mr4016552wmi.35.1594728009291;
        Tue, 14 Jul 2020 05:00:09 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id n5sm4032336wmi.34.2020.07.14.05.00.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 05:00:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: fix uenv errors while rebasing v2020.07
Date: Tue, 14 Jul 2020 13:00:07 +0100
Message-Id: <20200714120007.577999-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Damodar Santhapuri <damodar.santhapuri@arm.com>

     This commit fixes the erros while rebasing u-boot src
     to v2020.07

Change-Id: Iac926f77f80348b91f20f77fb52794a5a365a0ee
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 .../files/juno/u-boot_vexpress_uenv.patch     | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
index bb90c17..c68c173 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
@@ -1,37 +1,37 @@
 diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 2354f4e958..3e01f477dc 100644
+index 09cdd3dab5..7d6d231bd9 100644
 --- a/include/configs/vexpress_aemv8a.h
 +++ b/include/configs/vexpress_aemv8a.h
-@@ -151,6 +151,32 @@
- 				"fdt_addr=0x83000000\0" \
- 				"fdt_high=0xffffffffffffffff\0" \
- 				"initrd_high=0xffffffffffffffff\0" \
-+                                "bootenvfile=uEnv.txt\0" \
-+                                "bootcmd=run envboot\0" \
-+                                "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
+@@ -136,6 +136,32 @@
+ 				"fdtfile=board.dtb\0" \
+ 				"fdt_alt_name=juno\0" \
+ 				"fdt_addr_r=0x80000000\0" \
++                               "bootenvfile=uEnv.txt\0" \
++                               "bootcmd=run envboot\0" \
++                               "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
 +                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
 +                                "loadaddr=0x82000000\0" \
 +                                "filesize=0x4000\0" \
 +                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
-+				"default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr} ; " \
-+                                		"if test $? -eq 1; then "\
-+		                                "  echo Loading ${kernel_alt_name} instead of "\
-+                		                "${kernel_name}; "\
-+		                                "  afs load ${kernel_alt_name} ${kernel_addr};"\
-+                                		"fi ; "\
-+		                                "afs load  ${fdtfile} ${fdt_addr} ; " \
-+                		                "if test $? -eq 1; then "\
-+		                                "  echo Loading ${fdt_alt_name} instead of "\
-+		                                "${fdtfile}; "\
-+		                                "  afs load ${fdt_alt_name} ${fdt_addr}; "\
++                                "default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; " \
++                                                "if test $? -eq 1; then "\
++                                                "  echo Loading ${kernel_alt_name} instead of "\
++                                                "${kernel_name}; "\
++                                                "  afs load ${kernel_alt_name} ${kernel_addr_r};"\
++                                                "fi ; "\
++		                                "afs load  ${fdtfile} ${fdt_addr_r} ; " \
++                                                "if test $? -eq 1; then "\
++                                                "  echo Loading ${fdt_alt_name} instead of "\
++                                                "${fdtfile}; "\
++		                                "  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
 +		                                "fi ; "\
-+                		                "fdt addr ${fdt_addr}; fdt resize; " \
-+		                                "if afs load  ${initrd_name} ${initrd_addr} ; "\
++                                                "fdt addr ${fdt_addr_r}; fdt resize; " \
++		                                "if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
 +		                                "then "\
-+		                                "  setenv initrd_param ${initrd_addr}; "\
-+		                                "  else setenv initrd_param -; "\
++		                                "  setenv ramdisk_param ${ramdisk_addr_r}; "\
++		                                "  else setenv ramdisk_param -; "\
 +		                                "fi ; " \
-+		                                "booti ${kernel_addr} ${initrd_param} ${fdt_addr}\0"
++		                                "booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
  
  /* Copy the kernel and FDT to DRAM memory and boot */
- #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr} ; " \
+ #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr_r} ;"\
-- 
2.26.2

