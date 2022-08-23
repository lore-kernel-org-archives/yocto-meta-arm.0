Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EADFC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 13:04:31 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.31014.1661259867069910392
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 06:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=EsuPGjbN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id n14so7197200qvq.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GerG2kqyC+2++OA6VeMnOYKQ5yMqmqxs/lcd9Zis6Y0=;
        b=EsuPGjbNIA7+r6MQc4PgD3B/ob2NZw+2a7mip0yuOCXWuqf3xWpllbXbftII53L5SZ
         MwNXbNVZHYNki2LOUduh0z+JwIqTf8Sh4nnic0MD3kgum5+Cw6mm+8R/s88+xnP2GlhR
         XI3pFD7kouUpdgSkY5edbMq3ARBj+n1nUHWVaYWy6rk8q5TlTZACwMwFZRtAhHGChfWL
         GbbHYzG99qv7mbgP25cmEJ4oO6VVKJe6rDwzEhYgkMiG5LXpmuvYCt4ujOrc+iUQzL1m
         1E8uaXOelfoUrfk9BMZNDBIZJpfWNvJqDX8v9AbIpZOI7f4xnfutdPA9kbxdTBq4y0P6
         8wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GerG2kqyC+2++OA6VeMnOYKQ5yMqmqxs/lcd9Zis6Y0=;
        b=AGAtrIpffT2RAtcu8y3895+MTw1qbvhxrn3djXVNoDuYBTBvAwgL9gB7rY6BMAZ/7U
         L+n5PCOBAqyBzecOmTL6oB/wd/Eq5BI1GUJID5oo35UcIGLo+YDPmGApv67cocdQa1Td
         UkZA90tUaJ3lQthLAJMljK2wybXzoLIqu8tHlPs+2KqeqyuMCTAdR1JyBePZZBYjTu6r
         ebglebXtbrdxrexm+rieDfHnLEBCyYvr/mXqAhlfHBWgHxLyvT/RJnIDgS/Aypr34rse
         kgVX7TDYlpC+bxYwBAsVjJ/udnYcbXACQy9Xv5iYaL2xR7iGFl6ADM/4aekiOD5VG1u5
         UFmQ==
X-Gm-Message-State: ACgBeo2UCTL5BoYYvuT5lXbyGQjzziaLlqusmCkuuv7TOtsHdwMV26mf
	ygNm8SQtdq3Il08uHpp+pcpeUG8vh4HfwWtO
X-Google-Smtp-Source: 
 AA6agR6eFHgS36ieEDHYT9FqkByeOGkCZOeu2RnYo9FGWB4GQQL2a5HfZwUQjOIiwVcDrEGRm2l2Ug==
X-Received: by 2002:a05:6214:d88:b0:46e:64aa:842a with SMTP id
 e8-20020a0562140d8800b0046e64aa842amr19344404qve.101.1661259865470;
        Tue, 23 Aug 2022 06:04:25 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 ez14-20020a05622a4c8e00b00342eff84177sm11231368qtb.29.2022.08.23.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 06:04:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm/trusted-firmware-a: remove redundant patches
Date: Tue, 23 Aug 2022 09:04:19 -0400
Message-Id: <166125985928.880038.15456735061931299110.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165505.3603138-1-ross.burton@arm.com>
References: <20220822165505.3603138-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Aug 2022 13:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3711

On Mon, 22 Aug 2022 17:55:03 +0100, Ross Burton wrote:
> These were integrated into the 2.7.0 release, but were not removed when
> the recipe was upgraded.

Applied, thanks!

[1/3] arm/trusted-firmware-a: remove redundant patches
      commit: 6ebafcc6d89f3e04fa84b7be332ce254276b8f74
[2/3] arm/trusted-firmware-a: work around RWX permission error on segment
      commit: 977c5222d8c2f6f6c7e522e480a6e4cd40ba32d7
[3/3] arm/optee-os: backport RWX permission error patch
      commit: ac4259011f4c8cec01191828014487ccc5de73ca

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

