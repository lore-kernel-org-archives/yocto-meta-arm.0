Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCBEEED61D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 17:39:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.27808.1694799580698657356
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 10:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mmfjlXEn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-77058512c18so155667485a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 Sep 2023 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694799579; x=1695404379; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoL4nWVXb/NibczFIqmLu4mtMejTfiob7NupKNc1i6Q=;
        b=mmfjlXEnYZnS2wrRaouGPBm+fLwWuDcCqlADHYPKFOIKeHBe7NHDYsQLo6JOJH67OP
         HfU0/Yne4J7u7BlQuzii8LjpTvDMd7AGOzBsAHJcrI92JRjhyrhoj+XGLx9UROFHSV2j
         iFV3PAIRtEJ8Jb33kJIUNbskIVB37U60TRW015IyRwUxlIwuDx3l18FLlyij5u+R2p0S
         kCudMbwfX4Ay5GV15UIKIq/Zq2L10DGcRQ0Dju6cIzzM2uCt2xHgLiWEyj8U2KMHA60K
         ckfhfI0IU2P79FNmoBes5L2QZV/dl97IgmTBnT2JQ89H5Ob+PVSzNkuV6VLGOcCZRimc
         Zk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694799579; x=1695404379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoL4nWVXb/NibczFIqmLu4mtMejTfiob7NupKNc1i6Q=;
        b=LgriZfk/exlglFqV2lka+1dVcx+eTyyGtj3noyaQ2t1ZpCWYdHo45OX4qQbEZIocuA
         aHuFHkLS1jG2WUqXfICyArWiFkiei6mDE1JjoDv26N6ht9o5AVB486eoq8FFcDgQDk6p
         Z2WNAO1gWaoyJ4/ciVbJankGnDGNuHgwHo3IFLF8TtbP27EqxysGGByAaQUH3NntwklB
         sFi/mB2j8UHQUK6dy7lv8JVLfjzRFi3yiDeOtYj7SNLiacTvVTb4STgJiNmzL3TgRX1t
         qPsG8f+FrhXxXiwAAZCm9ZnynXjnlIvbk5k6BAkGN4t7zXyou4SJU0x4d5y3mrEBUgPQ
         chVg==
X-Gm-Message-State: AOJu0YznC+xDeoz6OjaknfosqWvRcJPMxZmcMXYe5vlJ4rZBuaKpPyoA
	KZhKpjeJjbdIBzG1w6BYfbhFtjSfOwKsLQDGRLE=
X-Google-Smtp-Source: AGHT+IEriIrYaFuYo3FBer5WJgIW6gKrjsxuWAt4L74v8o5n2IaBQrifG7uY5pjy+FSDHPm0fyUMSA==
X-Received: by 2002:a05:620a:4113:b0:76d:a00b:84f8 with SMTP id j19-20020a05620a411300b0076da00b84f8mr2404709qko.57.1694799579330;
        Fri, 15 Sep 2023 10:39:39 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k9-20020a05620a142900b0076effd9809fsm1364217qkj.110.2023.09.15.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 10:39:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Subject: Re: [PATCH] optee-client: start tee-supplicant.service when teeprivX dev is detected
Date: Fri, 15 Sep 2023 13:39:08 -0400
Message-Id: <169479955105.423322.5544753483914418935.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230914182616.455983-1-javier.tia@linaro.org>
References: <20230914182616.455983-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 15 Sep 2023 17:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5051


On Thu, 14 Sep 2023 12:26:16 -0600, Javier Tia wrote:
> It's expected to exist multiple /dev/teepriv[0-9]* devices, and the
> tee-supplicant service depends on them, which should be activated only
> when the device is detected by the kernel using a udev rule.
> 
> Improve commit f02d065dce, where it's only considering a path creation
> and not a device detection by the kernel.
> 
> [...]

Applied, thanks!

[1/1] optee-client: start tee-supplicant.service when teeprivX dev is detected
      commit: 1bff41eee67d6dafc7c58b0c88923a3c6f7a2a7c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

