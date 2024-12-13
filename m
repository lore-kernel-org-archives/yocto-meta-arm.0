Return-Path: <adam.johnston@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7ACE7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 14:10:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.16222.1734099033923097224
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 06:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ckLnPYwJ;
 spf=pass (domain: linaro.org, ip: 209.85.221.45, mailfrom: adam.johnston@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862b364538so1036317f8f.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 06:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734099032; x=1734703832; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrCXBfFCqV9R77LGlIqtLfs5gYtkRoUzCXb6dJ4y2SM=;
        b=ckLnPYwJ7WGA/X752sUFdB4vOLgTj1QbzOC52TW2d/5L59YyaUwOekm43vV40yKU1/
         SZhdaitjYmicf39Hni0mA2YADxKBnM/j1PGk+ok9JzA/ZDzm/87VYk5rDs3s/TIpOo9r
         zYTB4YPAbWHdcLZ5D645QBhwR6pRYJ51JTSfkVWFKW8sR02ghHTo7pqP1Jg0W1QOmPtZ
         NkdT/7ThPKThu4FYtl/e1FLqISau+g0rgNmdMIEFVT/qfdedvNlg9FAtFSA+6k5cekkV
         /Jc6UADjhSZXxvifBvHeB+cpM01UlZAAoXMipkEAqTSleZrKGkidrz0cjCJ1lg0GjZB8
         dVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734099032; x=1734703832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrCXBfFCqV9R77LGlIqtLfs5gYtkRoUzCXb6dJ4y2SM=;
        b=fkU8xYwv8zPBzvJoL09s0DubW7kdaCzMfKOxlN0dywx+jKd7gBCmXtqL5F+Luh5sxS
         PTYtksdQBi5ip+c6/jtkBeECArGpp1sFWtC4SE3uUTwoZ4w2Q/U78n/TFE4bz3FLdhQT
         i4EwamAEAgmsIunZRC0GSM+wHggPKU7DqoUjc2TmNj6sIZRWIzRTNPZVI7+I2zIRMnn5
         615iIYsczaqBJ45Np3smEAvCMvyNwPEY1nPfiJoZBIOHrN1JMjc6nDgFzT04oNU97mAl
         in0ClD+C5XE5dKtR2Es4kH9Ed2V54ofkP1Tqc1y8ZzuLPdPRhYr+SU6zOd9tn5V+PNMq
         F3Gg==
X-Gm-Message-State: AOJu0YwTv9ZO1Sz8ytbKoqf0PuMex+BI8PFARJgnaZJSR0CpFYmFPQ4m
	Zr11J8R2UPqzSU/F04LGh5hmFbYZFfIK73TGHIjIf86gr68wquRJrcVTdO1I6PiCI8Pikoskzoz
	4xKU=
X-Gm-Gg: ASbGncu2q6dzxScOaZdExg0S6tve26rUhKwo2wijOQh+szdYWrnRtRlaUq4JWmvcz3o
	DB/S7UfzR0LoYZPHdXOnpZq2ipghpBGuZczYk8atBA7enoHGonnooRAzgIs0Y9HmgjGPSq0CAba
	pRF8djUmKosd2QFzxKAHWGbjj1i4huWuZXZdJa/1QyhAf1h7pdwuYi/rpBB4eggVzM7QpLu5IB5
	TBdSYggUVB05WjyqpBSbUn+cmL3/2HtthTX/lLvROFg9VvambmlcltpkD0I9pCz0WY8P0wdSvoP
	FsroTVjTZsW+UqLR8EXPZAi9c3w=
X-Google-Smtp-Source: AGHT+IFdWvmHoAvs+apYL5Qp4aw+tGfD+KteigiLq1BDa1EaHJdjbl8muY8pZLCguXd/TEZdMFi96A==
X-Received: by 2002:a5d:6d08:0:b0:386:3d33:a61a with SMTP id ffacd0b85a97d-38788869cfdmr5799086f8f.27.1734099031699;
        Fri, 13 Dec 2024 06:10:31 -0800 (PST)
Received: from ip-10-252-32-24.eu-west-1.compute.internal ([217.140.109.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4d19sm7196218f8f.32.2024.12.13.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:10:31 -0800 (PST)
From: adam.johnston@linaro.org
To: meta-arm@lists.yoctoproject.org
Cc: Adam Johnston <adam.johnston@linaro.org>
Subject: [PATCH 0/1] arm-bsp/corstone-1000: IMAGE_ROOTFS_EXTRA_SPACE workaround
Date: Fri, 13 Dec 2024 14:10:26 +0000
Message-Id: <20241213141027.486517-1-adam.johnston@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 14:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6286

From: Adam Johnston <adam.johnston@linaro.org>

When images are repacked IMAGE_ROOTFS_EXTRA_SPACE is ignored.
This is not necessarily a bug but an undocumented quirk of how wic
works.
    
Evaluate IMAGE_ROOTFS_EXTRA_SPACE and use the value with the
 --extra-space option. Note that, since IMAGE_ROOTFS_EXTRA_SPACE is in
Kb, the value for `--extra-space` requires the explicit 'K' suffix (the
default is 'M')

Adam Johnston (1):
  arm-bsp/corstone-1000: IMAGE_ROOTFS_EXTRA_SPACE workaround

 meta-arm-bsp/conf/layer.conf                       | 2 ++
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 3 +++
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in           | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)


