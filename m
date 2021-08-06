Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.3080.1628285786241413440
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TdUHWB24;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id a12so7569015qtb.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5xRtwbl/vAqjQ8YxlHBLt08vBdmn4AaEPdA2PoIlspc=;
        b=TdUHWB24k7gMrBAeMzuTz8UVtpD/IN00c16TrCVjESmgY4QHi/S7FsYV124iEmwu1B
         v4J0DGBrQ57ZCMS9ETFYYkzdNEbx2zQB9mOMfmohbMAEOJfyXTdkwDGrip7d6Q36E4W6
         FAAJJpmYnzcLQEpjwGOZ3pToY8cC5Pt46aD2g8y5JL6tLy/duyhc6L4jH02NUQ4pIT3s
         GCfNFF+s0N58AHzJXch/SFkPm13EoK3kH6dvy39uLASA+d2mal9nBhbq+7XwzFu4c4h2
         LiriuwRcxWBKapZQhWXHLFp2Arh7+CeNv9Df8645w5EMHpoUTkBth+mnljnQjzgBOzRO
         BK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5xRtwbl/vAqjQ8YxlHBLt08vBdmn4AaEPdA2PoIlspc=;
        b=dXDIzAe2L9rGtex3VW8+kmqDLFZqMUY6LDmeJ99hBg66OoZ62IFZOXxfnYRXhZvAMj
         s0qgEOFdiRkNjWznSQEiYC4+qHKT4upN5sNi4z6xmUuK0dkdZNcypG4bcywmk2FPR1xR
         gH9obe7eVOcchsJ1yzEnY7a0nM8IhDbuNd1FlwIh2JWYL5t6JGEu+L5lzufBY91XVZDr
         mNY+NCGwM4PdN+M39NStMdn3U0QYGgdzt1yy40GvpRQInJ/Rf0j110zZCDEUsCD0STcS
         hFwnZtADPtIK1GlhIAn6lJybDQUDMXqxBwQX1aa1oKX+uI2nPAVAmPZAVCSTViwhnwFt
         wFWA==
X-Gm-Message-State: AOAM5308ETUVZ9LMACc9uJJUN6WPfLt2TQ8TDiBhigdwJTTkhPAExSTe
	q3hPBZBdDy3bQlvhZPkxctxxgE7nDeJo+Q==
X-Google-Smtp-Source: ABdhPJxgkPcEvmbYLAd4GGqck9APwDPPPgSgp1812nWzuv50VWVUFud7hFfPUkqwxsnsIs+/uEaTZA==
X-Received: by 2002:ac8:5489:: with SMTP id h9mr7633961qtq.391.1628285785173;
        Fri, 06 Aug 2021 14:36:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id c68sm5433946qkf.48.2021.08.06.14.36.24
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:25 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 0/7] more override syntax fixes and cleanups
Date: Fri,  6 Aug 2021 17:36:17 -0400
Message-Id: <20210806213624.22981-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few patches to fix things missed in the previous series, and a few
fix-ups needed to get meta-arm master branch CI back in the green.

Jon Mason (7):
  gem5: Fix xen override syntax bug
  CI: fix check-layers
  CI: use meta-virtualization master-next branch
  juno: temporarily pin 5.4 kernel version
  corstone500: clean-up kernel entries
  CI: rename meta-python to meta-openembedded
  CI: move xen specific changes out of gem5-arm64-xen.yml

 .gitlab-ci.yml                                | 22 +++++++++------
 ci/check-layers.py                            |  1 +
 ci/gem5-arm64-xen.yml                         | 28 -------------------
 ci/gem5-arm64.yml                             |  6 +---
 ci/meta-arm-autonomy.yml                      | 14 ++--------
 ci/{meta-python.yml => meta-openembedded.yml} |  2 ++
 ci/meta-virtualization.yml                    |  9 ++++++
 ci/meta-zephyr.yml                            |  2 +-
 ci/musca-s1.yml                               |  2 +-
 ci/qemuarm64.yml                              |  6 ++++
 ci/xen.yml                                    | 11 ++++++++
 meta-arm-bsp/conf/machine/corstone500.conf    |  5 +---
 .../linux/linux-arm-platforms.inc             |  7 +++++
 .../boot-wrapper-aarch64_%.bbappend           |  2 +-
 14 files changed, 58 insertions(+), 59 deletions(-)
 delete mode 100644 ci/gem5-arm64-xen.yml
 rename ci/{meta-python.yml => meta-openembedded.yml} (76%)
 create mode 100644 ci/meta-virtualization.yml
 create mode 100644 ci/qemuarm64.yml
 create mode 100644 ci/xen.yml

-- 
2.20.1

