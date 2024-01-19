Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7481FC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:52:47 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.22483.1705672364414237998
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 05:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZoFkqTdS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.177, mailfrom: jdmason@kudzu.us)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4bac495c690so186471e0c.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 05:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705672362; x=1706277162; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwXcpE9FUpoSL+QvtCnt69DT0tPPKr6fMYR3kdjPHjM=;
        b=ZoFkqTdS//cTM22oHsADJPb5jaU6hGUWDCdO3qx5YE9eqTp7G7XYIXXbi5Wiy53etM
         52IueJuFyE8o9EBoHItvu8NVPezIMYDatBuCO6a0wcYSg6kEX3rhociP9jUSTq6qUhGG
         UC/84jC15ddP8Jm732qCvd7Vgze0DF25/BlM1g/e2UZb/WWiVaQ37SgMMBFzKv+ukJ9p
         uGYEfCNtSiCV16+ZKurqD+8H0krOfDVwZpo4JCOsbWkUFCfpsL6jRpIoAH4UMryOMOy9
         0rLOge3+NAscon1ZW+sD2kupmOcz8+EYyd3HkSgAOq7Y47Jfxuy9vcfEwvWh7XVKJqDi
         sYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672362; x=1706277162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwXcpE9FUpoSL+QvtCnt69DT0tPPKr6fMYR3kdjPHjM=;
        b=M15tk5dqOxzLbnhTFGQh/zhisWusLlgcViax4Cn03Nb1MqIx9D4mcWL3BhaWIayq/K
         jAPCVJmpD2CvTp/Fjg3a1O6MGkZiIxaJIaKfstYk3fQ/lbDt5TZadcdCvT8z0OziTDjm
         8M5OQOfRXKETt8EkIdhro703ejj5Cvsj0auZTyN1T0iF6BtYVevmdDGeTd/H9U5fot/Y
         Pk0dlLQBgSczXH0W0h9c8dBm+63KrNV2zcayoYcrPpjzVvn7yGtBbNohID6cckoyRh3h
         2cmPpuade1oyJdR+AONq9icgCg8msqhbo0pdAnwcslTrURCiXAg2GDg2ilL1qw6WA7cN
         uE/Q==
X-Gm-Message-State: AOJu0Ywor5HVQai4I+Cyj8gL3cvgwbm2H37TGU3QnG5oOe6NxvqBcEzj
	34VpgoSJqX8WSzfq4SciiI36gyJbcu2MaMpPt9zIHfH4cqfOst7MgCVnyCj50wYUzVNPLCh2YXs
	=
X-Google-Smtp-Source: AGHT+IF3fUkJ90wB53wGlReP9SJPSYaHia8TOQryZBDBYlxrN73WcQjQWOhxjg1RXRUXJWokZtaseQ==
X-Received: by 2002:a05:6122:3285:b0:4b6:b647:db94 with SMTP id cj5-20020a056122328500b004b6b647db94mr1553543vkb.10.1705672362388;
        Fri, 19 Jan 2024 05:52:42 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e13-20020a0cd64d000000b00680b1090832sm6691190qvj.146.2024.01.19.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:52:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] arm/fvp-base-a-aem: upgrade to 11.24.11
Date: Fri, 19 Jan 2024 08:51:36 -0500
Message-Id: <170567229732.3021912.4221293019750267317.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240118143001.2600949-1-ross.burton@arm.com>
References: <20240118143001.2600949-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 13:52:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5345


On Thu, 18 Jan 2024 14:30:01 +0000, ross.burton@arm.com wrote:
> 


Applied, thanks!

[1/1] arm/fvp-base-a-aem: upgrade to 11.24.11
      commit: 3d3cf56dc99ee8510148838104219b9c3de29e1f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

