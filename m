Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473D1CD98E4
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 17:35:00 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10231.1781976892757909764
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Jun 2026 10:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=bg3hrrvC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-915c48e6ae2so244454885a.2
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Jun 2026 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1781976892; x=1782581692; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0RK8jPc2Unf16hqIFY7eJFZJIEwfSZ36rFtSXfPmf8=;
        b=bg3hrrvCsoehsYRQzm8XNUAmB5vfNyrV9QT7oDi9dobS3KGCiz+RbkCKbVpkdvLBLw
         cpZE9d8ATvYhOAM9lpPp7wbv/utU50s/BgYGcfAlPlP893/6WRZKJsN5LRWPB1ztPUvB
         hta39wUZlDe5DYQUFF9ucn3c6P+1MXWdfl5hkORjiZN7yyGVjQTqvdgNDwY4cXfxAJTB
         0JStzl+I4vXy1ddfDlrzsurX8eC44/hE9RAQ/jNNA40n/nH4IinuBJtYJTll3xST4PWd
         Ry/bwcZbiNTiRbEACgklPXzXplGt0js5er/rdtFJpKs9gOpCJOB/M828gRkDJqkGztBg
         fHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976892; x=1782581692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0RK8jPc2Unf16hqIFY7eJFZJIEwfSZ36rFtSXfPmf8=;
        b=YgUJrzZLMBVwXVIn63djntEqIWujDBPRWC8EsvrTuRl8PAcCTfguTJ0fWC93ae7Vxs
         m4+rRuq6QKbTFC6VMukpxA0jFsvy/VnONEmiVFRT2+JNYSgehj+CZNDqkZ7oxOhjuLMX
         L6gRaACCDibNOUOu6YKNgbrn3v5CEAEr/QcsImWmjoaoc7d7QkHiivpBc8J2Oti49uqL
         /5tRzkIVrQW8D3m4mB8ocwYXk1q4ekA6IIfNa3SJPTh8tMu41bEofHv8dadHLdt4/vdN
         RCJSu9K7qvEjOP3yieaJL7BYRjPSRYuqcF8gyfdedtxJMqCqqExJdCKvsLSToh8Prssd
         +nuA==
X-Gm-Message-State: AOJu0YyG5dnKjZz/yebP7rv5OmCwNUhECyUEtbjDBIMhb7h07Z9d1L8y
	v2mKhPMDuGiPMAxHIGm9HmOWrwxHcGCFFp8wP2zzBlj9UVDrpRMIhwbbQnY2cxGZFpUjt1M8vBJ
	CrvbFkA==
X-Gm-Gg: AfdE7cmezEClJL5Zm8ru0yPgmEW7k+lQzg2L3PsDKWYS7MsJR5nu1YFV5XX8Hz1tQBo
	reVKE8p4AM0L9CHjvilARfk3pdacUWE+ny2C9EMGqbbBzJbMsSfdNOCa5XS9cl4kknCjKFqHfwT
	6Vi/xEkFWuqqfbIcyxpKpE8hIn5WVu/LtjSsK0UpQzCwNsHm6+6odTHJdut2SPzVsQAHy03dZOp
	39y0NStxz1m+rpZA7gg9M0R32w8xQaMKN8r4hOb1JmqFiG1tE2Qe5CamMS/yLC2DtkJJW8dG455
	0jAUIUGHAWCwKAtF+FFxmAwy6T+NvvdczY+1enrMLxI0D8gBf7tci7TTwbcDqvVhFyRAX4685M5
	fuGzTioOCEuoTSyUZdG9/yA7HQjyCIVDR+D5EHjcgcTVmw+eQa4krXbhilPhftr1Juo2L2EXQQw
	VkgA==
X-Received: by 2002:a05:620a:2590:b0:916:411:a143 with SMTP id af79cd13be357-9208fc1621amr1485213585a.21.1781976891622;
        Sat, 20 Jun 2026 10:34:51 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921db15cd97sm346173485a.35.2026.06.20.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:34:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/7] arm/trusted-firmware-a: Add support for v2.15.0
Date: Sat, 20 Jun 2026 13:34:39 -0400
Message-Id: <178197687885.4020114.11995368648529520744.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260618125918.62619-1-jon.mason@arm.com>
References: <20260618125918.62619-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Jun 2026 17:35:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7095


On Thu, 18 Jun 2026 08:59:12 -0400, Jon Mason wrote:
> Add support for the newest release of TF-A.
> mbedtls was made a git submodule.  Given that this is no longer needed
> for the generic inc file, I've moved the relevant parts to the LTS
> recipe and others using the older way of building.
> 
> Also, seeing some weird behavior with CPUs not coming on line in
> sbsa-ref and qemuarm-secureboot.  So, pinning those back to the LTS
> until they can be sorted out.
> 
> [...]

Applied, thanks!

[1/7] arm/trusted-firmware-a: Add support for v2.15.0
      commit: f1098681f4476c8de1b6a74c0b3c021eb8563582
[2/7] arm/trusted-firmware-a: remove older LTS versions
      commit: 66c46946f5050c12deeaa0909b9fe75ae2c9f799
[3/7] arm/trusted-firmware-a: Update LTS to 2.14.2
      commit: dd460eb29d03ff1a25ae5d97ad49bde834dcb614
[4/7] arm/trusted-firmware-a: Update git recipe to the latest commit
      commit: cef3e3a22c4d8b63e26377fad60e67bc61545f78
[5/7] arm/uefi: update edk2-firmware to 202605
      commit: 200ccaa637316cd66e85015685b84776961c7275
[6/7] arm/opencsd: upgrade to v1.8.2
      commit: 9014a4e935c29ff3e8bc1d1ed707c85957e0257f
[7/7] arm/optee: update to 4.10.0
      commit: 3681201897f164408194e4cc823e1e3650607dab

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

