Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.8133.1591095922077853558
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 04:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TryErggk;
 spf=pass (domain: linaro.org, ip: 209.85.215.174, mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f174.google.com with SMTP id m1so4940621pgk.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wlnq6tvbYV9bQixTRfvW5gQw68yl/fagT9Xol4hDApw=;
        b=TryErggk2LJajxWL4tRKj9EokwlGlO1wo6kd60Qso5S+h7VNRkZRYZ4uiF4QBGFHIt
         YRBisseM49e9E6Wo9bnCPoMjYBv3qZ5mAJ8zLnQNOB7SlbfcyA7w8qUEM1ZU1gSISIp3
         2olNfjWNLUnW24Y+GGK1Nx+D2GDOg2a8svnzDP5ipVW8AlzShtUtsBCPeMegDALJpuhc
         yixTFJx8vQJ/ca1Oo30zbZMMg9IVaUJUD8OIOnJUunq26J67qo6drXFVxqUSI3tn0LqQ
         HJDx7j469SYThBLGHB/umsIt4mW/jH5I5a0db+O+6QMnTQjT3QDa5NE0KANc69HKTx4w
         Ehtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wlnq6tvbYV9bQixTRfvW5gQw68yl/fagT9Xol4hDApw=;
        b=O5Olj6/MML4rXgPDqKbssLCiBfQ/wQBPLpCUsCaNNhreyhbjINHZf+GQTpWx1qGzIt
         ocT6hl/6HYW/WdOkoPYA4z4zgt9udr+6sO1VVCft5tKiZ8dWzslM1A015JqUGuN4i4bt
         4mVDZnESajwNTYVq4CwqvciD2gW1X+4KZVE9PgGWRoFDXnWduy2r/1/UScCb4QJOWtXn
         Y17rMUtkKMurP/ThY7nxjomcxKa5i54eO9GXSDMuLV4tKZ1e04j0/PwVkLgbDwv2i3qd
         yIvw3j5QwgdC3NRk8Pe1fud7QevMakc975hTSRX1HaUwuj3PgYp2RCXH5F6BfPsKJdD6
         9Zbw==
X-Gm-Message-State: AOAM532uKXMCJy0h0D51OFQjUIOBoXmgepjzFXM+vOrndDzO9iejbjLf
	gkkLkLmI/Z0su/ywFN31AuE6Kt1ggoY=
X-Google-Smtp-Source: ABdhPJwvZYtmkFlsV4NNWN3b+hODXQA1T/2NT8p1YC4LrwxnSsqz/3FN6uk7W35378bwbBQG4Xvq3g==
X-Received: by 2002:a62:1d48:: with SMTP id d69mr25565721pfd.27.1591095921092;
        Tue, 02 Jun 2020 04:05:21 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id w12sm2277895pjb.11.2020.06.02.04.05.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:05:20 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
Date: Tue,  2 Jun 2020 16:34:50 +0530
Message-Id: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

Patch #1 and #2 adds impprovements in external-arm-toolchain recipe in order to
support SDK generation. SDK generation has been tested using:

$ bitbake core-image-base -c populate_sdk

Patch #3 adds a README to describe usage details of pre-built Arm tool-set.

Patch #4 adds package specific licences for external-arm-toolchain recipe.

Sumit Garg (4):
  external-arm-toolchain: Remove glibc locale dependency
  external-arm-toolchain: Refine dev libraies packaging
  external-arm-toolchain: Add README
  external-arm-toolchain: Add package specific licenses

 .../conf/distro/include/tcmode-external-arm.inc    |  1 +
 .../external-arm-toolchain/README.md               | 50 ++++++++++++++
 .../external-arm-toolchain.bb                      | 29 ++++++++-
 .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
 4 files changed, 154 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

-- 
2.7.4

