Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16684C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 13:07:54 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.19841.1690290469458101995
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 06:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=DrHhCc4l;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-765942d497fso491874585a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jul 2023 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1690290468; x=1690895268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZSlAb5GxaH1pKyYROxI+OURAPvgo6LszFuoHtiRpIg=;
        b=DrHhCc4lMh6Aqu5bqok9ZHahHUMoOVkIJi9fgvezYQJLWeKQIZ8FB40S4Oz/J1KIJY
         Jv8CgPibHgE+woogMLGFTHLUZky69J9m7WN5Qo99gc40EfPuSJvdPzUgU25EVdYauF9y
         eUwW8epzzaFWP+jyIGXtG6PiuCyu6qEgbgegk5t1avXaFlZRprUkCKi44QnoDcxIj/R6
         L9n1Ig1tQerEkovuDPiPJIMGCGxWg1XVFePkqKdsXLKvRae4dyP4BI80UQeILmPQX1DS
         VUgSofsU2hP+i02j7Fyje7VbhhTSBTEs6Jf9ej39Inz6ZB4h24dezB1FrOo3hVgDK587
         EV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690290468; x=1690895268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZSlAb5GxaH1pKyYROxI+OURAPvgo6LszFuoHtiRpIg=;
        b=QxloZKU231m7I+HhLzn/ZxqDWmpd1iCPrqcUQTMttkhIBGt8Ybw9LVPQ4680kTbeFu
         8B/J1Tf2jAfrXOyFiVIZgMtTWWAMrvFr11lBYiabJKA+vdL6yHmhIXhNdVh5H44Qfdvi
         dIbjScY8Z6XjzOzikub0vMNT7aMGLTeIgxSdDkpJmQ+tDoDth+vJoYLtW/6f+bTIGePT
         k+sWG/882bu/SbQh05sX2k7Db9qx7TON8gETbEbUkCGoBg8FL6GRpqAMjEKqKalL1oho
         o6BBjOWg6uJX4IXYtVsqGYux8DCvLwAgrnq/gtJfJwNsqfQ3lw2kprbCa27suZcmgA1G
         TRAw==
X-Gm-Message-State: ABy/qLZh55slDTzeuMbTy4qZdipHeBeofyZCzc9E+SvS6CZKSIoLzbom
	ZYQ9z5npHbZdwY7phLSedTXV3CgNuC13uZAx3fg=
X-Google-Smtp-Source: APBJJlGSU8+9ZOJJLw4WNlKJ+islXwQ3P4BicuPq1v2lPEuKYsG/NYySMq+VEX8/4rluVOrlAa4byQ==
X-Received: by 2002:a05:620a:20cf:b0:767:26a4:ab3d with SMTP id f15-20020a05620a20cf00b0076726a4ab3dmr2855862qka.19.1690290468112;
        Tue, 25 Jul 2023 06:07:48 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id o11-20020a0cf4cb000000b00635fc10afd6sm4351606qvm.70.2023.07.25.06.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 06:07:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] CI: add defaults for get-binary-toolchains
Date: Tue, 25 Jul 2023 08:52:09 -0400
Message-Id: <169028952899.2433983.6193875135575901214.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721032031.3584730-1-jon.mason@arm.com>
References: <20230721032031.3584730-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Jul 2023 13:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4919


On Thu, 20 Jul 2023 22:20:30 -0500, Jon Mason wrote:
> Pre-populate the standard values of get-binary-toolchains so that it
> will work without variables in a standard kas container.  This will aid
> in ease-of-use for development and testing of binary toolchains.
> 
> 

Applied, thanks!

[1/2] CI: add defaults for get-binary-toolchains
      commit: 887e47b7c59ebe6a45d8a4d959f6966e69789a87
[2/2] CI: workaround 32bit timer warning in binary toolchain
      commit: cfcc8a4d13c26793ecab2d8da9274eb98b8cb4ce

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

