Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0B7C624DB
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:26:56 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7587.1788388009181374306
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=W9P05+ei;
 spf=pass (domain: peridio.com, ip: 209.85.222.53, mailfrom: javier@peridio.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98068c98726so58761241.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788388008; x=1788992808; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENWRv7byagEbX6RgGwMFaoFl6CwbakchMW9+sPh8GUY=;
        b=W9P05+eiv1sUqwT4PBAzq57fsi8C9iQJFWHb7Rc84NPR1xjt5V5HNRbHBnKhdX5p35
         iUssEjzTn3J7qiuRivv4y6+efVMzk2i2E1DSYWEzG9x0h6kKf99D/5+zQ+gwtM4LZJye
         08cj+PWKB2kJaCwPG07KYMAqRFIdgcs32CTsCGwkzq9Agb2/JQV12pb3fTwouG+gJKnG
         caKZHVyCgjoprtcWcfVgs+Q429b8EktRonM6AMp6BrpewpYYFoUf8crBWkvkFoYfYpyh
         dbeoRQcx0hZKWcDTJbitE8zrbpgXyPxBe+MOkJ4ywsKy36JpZaIGPcSrZcP0KhNZuMqy
         uqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388008; x=1788992808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENWRv7byagEbX6RgGwMFaoFl6CwbakchMW9+sPh8GUY=;
        b=nDugn1abCwLafNX0dnpWlq8jPojp+lFIihqUQSUW2HkXpJ2rWY09MnWPyDajJ74ja8
         HiSKx+//RVMzdx5JnNNw6VucaIQAghtDHu028j/4KGAI2CM8A2AigicGyXhdw7IexVpn
         gjL5qJI3BKIvQlv/jj/U5/vq7KfZ8IASgVwziyEKf+GCU4KJa1AmPXC4/quqP9JT3IzE
         pMMhEyGOUm+TupQgn7GxXu2UCBMRM4SDY0EDzVcxRURhFsioIiJSsj9jd/1Z7Wjt7i89
         KOJEGBI5C5HZGJiMJa9HvyY0EweiKkhbBiwCcQcPg9uhNcyGCj0ipvIE7T6xd3pFc9C/
         4HFQ==
X-Gm-Message-State: AFuF++m/IQrqIeWLUEHEDKMAm1HxRqZY+gR96UFBb/9SMqX4r3wcX6mi
	Mllk57M8lmzxwZ0Stn6zVcIU+3C27VPXYMrpt1WAHv6o1Xvr1kpvN4LHA/pmGWqdAOW2AGuN9vo
	hMRrNJA8=
X-Gm-Gg: AYBFou2iqSZK3svYHKEeSUQHiDG2TbrKqVG6zAZTRZN5ZesX35HBpTIK6lgAgxJyAdw
	hojdkDFlF86zN8zM9E8oBWZp+KwB6IFYONuueLb8Rq7x9g113Oe2YXNgBPyCytafkN7BQZNMoAn
	P8+nMtJxdrk+4+lqKU2CxizFohzCWevjFsTNEEmNYSyxHU9WHyqtCJB8/Mha2YmBres67/HAlqM
	hWTAqKWcD4WJOXyRwL88hmzuZ8aFsLhH52QJWmxjJ3NVt7vzpgaouXBsUzzQNDrZ/gP4DzTetHO
	HftjAZtLfjICAiBq64PnfaO1d86keluAxvazUPXg02nKMNG4t6ReZTn91zTItw6G/6ruO+nVyGb
	dv6DVDvzPUhqiVypj8noP5GhOlEBW1Fz0O8pkSM81wR6EPI7wX3eqMiNVeU4y3C9zkvrv5D26sP
	toH4r79Pg3BL+5X/pe96OVCXxwrgEefQnjj9QgnkgBvtcSNYOY0jrm9jc=
X-Received: by 2002:a05:6102:f8b:b0:781:9922:78f3 with SMTP id ada2fe7eead31-78a1f6661d0mr1340599137.2.1788388008114;
        Wed, 02 Sep 2026 15:26:48 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a510ca3sm3385211137.11.2026.09.02.15.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:26:47 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier@peridio.com>
Subject: [wrynose PATCH 0/4] backport the CVE_PRODUCT fixes from master
Date: Wed,  2 Sep 2026 16:26:42 -0600
Message-ID: <20260902222646.2945592-1-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7152

The four CVE_PRODUCT commits from 2026-06-10 never reached the release
branches, so cve-check on wrynose still scans these recipes under names
that match nothing in NVD. A recipe that matches nothing reports zero
CVEs, which is indistinguishable from a recipe that was scanned and found
clean.

All four apply cleanly here. The same series minus scp-firmware is sent
separately for scarthgap, where the shared scp-firmware.inc does not
exist.

Measured against the NVD 2.0 API, replaying each CPE version range through
oe.cve_check.Version at the PVs that ship:

  trustedfirmware:trusted_firmware-a   7 records, none reachable today
  arm:arm-trusted-firmware             0 records
  arm:arm_trusted_firmware             0 records

For trusted-firmware-a that turns a silent zero into a real scan: TF-A
2.10 gains one genuine unpatched finding (CVE-2023-31339), while 2.12 and
2.14 gain the scan and no finding.

Note this makes affected recipes start reporting CVEs where they reported
none, which will look like a regression to anyone gating CI on a count.
That is the intended effect rather than a side effect.

Cherry-picked from master with no changes; each patch carries its
(cherry picked from commit ...) line. Found while auditing CVE_PRODUCT
coverage on an i.MX BSP built from scarthgap.

Jon Mason (4):
  arm/optee: modify CVE_PRODUCT
  arm/trusted-firmware-a: modify CVE_PRODUCT
  arm/trusted-firmware-m: add CVE_PRODUCT
  arm/scp-firmware: add CVE_PRODUCT

 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc            | 3 +++
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 3 ++-
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc     | 2 ++
 meta-arm/recipes-security/optee/optee-os.inc                  | 4 +++-
 4 files changed, 10 insertions(+), 2 deletions(-)

-- 
Javier Tia


