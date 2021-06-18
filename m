Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5729.1624009246830748221
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 02:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CED01424
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Jun 2021 02:40:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA74C3F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Jun 2021 02:40:35 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/sbsa-acs: move alongside edk2-firmware
Date: Fri, 18 Jun 2021 10:40:32 +0100
Message-Id: <20210618094033.536930-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As sbsa-acs is just a EDK2 application, it makes things easier in the
recipes if they're in the same directory.

Change-Id: I4b6d715213681bb2d942589ad85bbc399721df97
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../uefi}/sbsa-acs/0001-Fix-VLA-parameter-warning.patch           | 0
 .../uefi}/sbsa-acs/0001-pal_uefi-Fix-enum-conversion.patch        | 0
 .../sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs/shell.patch            | 0
 .../sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs/use_bfd_linker.patch   | 0
 .../{recipes-test/sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs_3.0.bb   | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm/{recipes-test/sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs/0=
001-Fix-VLA-parameter-warning.patch (100%)
 rename meta-arm/{recipes-test/sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs/0=
001-pal_uefi-Fix-enum-conversion.patch (100%)
 rename meta-arm/{recipes-test/sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs/s=
hell.patch (100%)
 rename meta-arm/{recipes-test/sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs/u=
se_bfd_linker.patch (100%)
 rename meta-arm/{recipes-test/sbsa-acs =3D> recipes-bsp/uefi}/sbsa-acs_3=
.0.bb (100%)

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-Fix-VLA-paramet=
er-warning.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-VLA-parame=
ter-warning.patch
similarity index 100%
rename from meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-Fix-VLA-paramete=
r-warning.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-VLA-parameter-warni=
ng.patch
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-en=
um-conversion.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-pal_uefi-Fi=
x-enum-conversion.patch
similarity index 100%
rename from meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enu=
m-conversion.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/0001-pal_uefi-Fix-enum-conve=
rsion.patch
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch b/meta-a=
rm/recipes-bsp/uefi/sbsa-acs/shell.patch
similarity index 100%
rename from meta-arm/recipes-test/sbsa-acs/sbsa-acs/shell.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/use_bfd_linker.patch=
 b/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
similarity index 100%
rename from meta-arm/recipes-test/sbsa-acs/sbsa-acs/use_bfd_linker.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/re=
cipes-bsp/uefi/sbsa-acs_3.0.bb
similarity index 100%
rename from meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
--=20
2.25.1

