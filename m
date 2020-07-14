Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.19037.1594731887497973459
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 06:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=rlhj/Jcd;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id j18so5621287wmi.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bPgNwZftcGq6IF8z9KIsZI3KCG1av3YnUZqJS3vrJ9g=;
        b=rlhj/Jcd5Y1Xxoe+nGQJbdul03FISrexJ1HAyMiwzCJmv4CYLla8+5gsIhMNbILbpb
         sn7rrhJdfEZb2mKLzSU9TaCAUfbk9ooEKVGHgk2WoABjJzka+Uj1GFutziOvnvrFF01/
         EwDf3pgCDNnJvMJkC3Yw8OV8kdDoSSW04GZVLO+Kh/Ue6q6xnGHaCg7ctC7o1/m9kU+/
         yFogLvNlAtJ2Mz/i/NTLqJNZTr58SQ6JB16oHKyfV6X4PpGDNV+6PVFBjPy4gG/aGCU+
         Zd9R1CVhRWPWqspvZttoTwj69vfFQIlPPs2jbvndxcUr/yXdbWmjXxi3F5d2Sfin8dbv
         vRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bPgNwZftcGq6IF8z9KIsZI3KCG1av3YnUZqJS3vrJ9g=;
        b=bgTztbB09nZy+zmgH0cQxX4U87V+L/DHpIk16W6yhwsu2D6dU+lM1X1VMZkTvqN57I
         JFiENcLQiAZVDYjPbklsJnkeM//LwwTateoInmV0AlseztMpu+7/XQx3t0GUHDVl7Q+r
         xawFZPRfohkaGkyTP8Z6gKjrnRvIrRZOG8y+s3yM16Ka/NCNNDLyfM8OIR4U+hc8TTJr
         HJnoWKwqT8Tg0Qmty9ufVdnSzzTAfwrQ3zqLelX2NuiBZWL+FTHFMxGVKUu/nuvVCbuM
         ADuiFW/9X8bLI4BSQJqhNPBN1LwwhWRkCkm5kxc8xR7SiYdE7a6d6IBuFcFRq4M46cb3
         0k6g==
X-Gm-Message-State: AOAM530rnS0k807bqvJ/Z4LADqgNt3QncQ37I+HQUM4f4lcNdDbumf0H
	4o3rX6ddhiORTergJtLNpbBx8T6RW5k=
X-Google-Smtp-Source: ABdhPJyo3D5WExi8JG+fmJBdxOchbk29c74f2KgERPQ4ZBtuGHuzxMO2fvJupAkmyx3BMjJC31IVEg==
X-Received: by 2002:a1c:2485:: with SMTP id k127mr4273332wmk.138.1594731885574;
        Tue, 14 Jul 2020 06:04:45 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm4469831wml.42.2020.07.14.06.04.44
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 06:04:44 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] opencsd: put version into PV instead of SHA
Date: Tue, 14 Jul 2020 14:04:41 +0100
Message-Id: <20200714130442.580205-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Change-Id: I3615737fe64b26249a0405dc20843735913b3078
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_git.bb => opencsd_0.12.2.bb}                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_git.bb => opencsd_0.12.2.bb} (100%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb
similarity index 100%
rename from meta-arm/recipes-devtools/opencsd/opencsd_git.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb
-- 
2.26.2

