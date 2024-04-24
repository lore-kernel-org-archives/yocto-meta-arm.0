Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13D6C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:14:56 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.17602.1713968091076984698
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 07:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=T45c2kBl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.54, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6eb848b5a2eso3789198a34.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713968090; x=1714572890; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwONOKNeHG+ltcvCKSzFlBgKmECCT7Wk2O72vhudBes=;
        b=T45c2kBlzUpkzXxgBtw4Pt1LAhYi/1ZfJ52mFeuyVmixIs+CPN8Vf03nEwfTol8Hsp
         SkGX8sMlBAjV+9YYZIEqkbbYhgCUWukvUYYNXfqjfJNjGwm5XDA50ho7/mmg/h+DYW7U
         Di4sCzjDnIKdfgQGthLeeLxB2t3UFSE7KFaYzLQo2z9V78vKviCMEAgYGT1T2NXam4zi
         4RvNaOmLlANfA4hBWflpQxU2p5/GYHHj21Qf0GPpwxEi+spUAxJyx1JL04C03rwht7MR
         oB+dOfvu+Nv+1HeIzAUpINa/iF2aPg5Z0BZaboNFUFa0C4OdiXKrux6i3E77wIw/56Q3
         ooMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968090; x=1714572890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwONOKNeHG+ltcvCKSzFlBgKmECCT7Wk2O72vhudBes=;
        b=azcK0eY+oVbm+1b0PHy6TFMcZ7BBY4ey4XvszswvmAMOLo4YPZ1dsy/p53Y55urGHx
         Lsvua8/CH+p4qb2BtEUop7ttDEAxVk83BJtzlXJGZjH1ZHlqNtZcrGxmyxtg8fvslI2o
         FYH19WGjgfg/uz7JJxRBByxJ3IgyPbPY/hTkiGmivsI7AtH/kOzKNMPUgNdzerlmQhL/
         2XC9+uio5NuKQwukOJGTX8I4iKDcRdW+haDjvYxS3xAxadT0tT8WRDNaQgCeEZ87zO9k
         JFgyVMUbitlQTo1L1NHi8ka4xknp3Oo2WjO+uRNl1S1ccWNMsROJCr/uaAknNw/R856S
         Znog==
X-Gm-Message-State: AOJu0YwDKlMVw7jKvcRBiJ5yQsOZIBM2c5IAZLrP118qSrgxPoOiPJFa
	lpxay242hE1FzQ1Oi5b/9S0ZXFqi4R11ubNLWPf6o6Yr+hJBZhuT2/WNkbQxA+k2q5PH8l8Sd2E
	=
X-Google-Smtp-Source: AGHT+IHa3rRPeOC1U5ZqxF7ZDrwVLxUPahzj05GT9EAWva/jdyIGXkPel97kWD+H4yeRZFttThHSrw==
X-Received: by 2002:a05:6830:1d6b:b0:6eb:9497:5d46 with SMTP id l11-20020a0568301d6b00b006eb94975d46mr3129672oti.7.1713968090207;
        Wed, 24 Apr 2024 07:14:50 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k9-20020ae9f109000000b0078ede0c25b5sm6160059qkg.23.2024.04.24.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 07:14:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: add Yocto Project SSTATE Mirror
Date: Wed, 24 Apr 2024 10:12:28 -0400
Message-Id: <171396794983.193657.17896440020331564262.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240423133708.23216-1-jon.mason@arm.com>
References: <20240423133708.23216-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 14:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5604


On Tue, 23 Apr 2024 09:37:08 -0400, Jon Mason wrote:
> Add the Yocto Project public SSTATE mirror to its own unique yml file.
> This allows for developers to use this to speed up builds, while not
> adding in the default case.  This "off by default" is because it can add
> 10s of minutes to each build, which might not be beneficial to those who
> are using SSTATE dir locally.
> 
> Also, removing the removal ptest distro feature, as this change prevents
> an optimal usage of the YP SSTATE mirror (~30% match to ~90% match for
> qemuarm64).
> 
> [...]

Applied, thanks!

[1/1] CI: add Yocto Project SSTATE Mirror
      commit: 6e9525115bd45c86e241d62a4af069f7b1b8b973

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

