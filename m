Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDDFC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:28:00 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.9648.1657636077047198768
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=P5+9E6tL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id cw12so2652864qvb.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S4WQvVVnCuT3XedguC3vYqY6yya01Dzej4yWNC5T0HA=;
        b=P5+9E6tLLJXOlAglbA+MIw5mycQ8Mfh2IvJfO71M4Eu3goT+AyaCY41wL3qCrg3qbz
         RRqvIzPjl+JPomZxYdafviLS8AuVObiNwJIwO6Nx94VXPms+j2f0bEIC+rpmnNJ1FYoW
         qxBUp30SGFqBv8jIIn61/2Q/V8svqKRQAt4P0OhLpJ/OCk+LWSAFEXOk5D1+5WRjmKAa
         7TM5nhFIcfhevpH/RH8j3cKpdncl4Kh9wJ/E6u050C6yfJC2EbKrPuX41y73fPRXPkqc
         8+5mAl1lk5jj9rJtBMk9Gv7gKI72wqBeA4pLw9QEmuJ58GPq3GZtpnZs0dFk3iYsIz1W
         omgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S4WQvVVnCuT3XedguC3vYqY6yya01Dzej4yWNC5T0HA=;
        b=yiDkTYid1eZgvgjqDiwjcNyFXmIGGQO+QTAoL5lsyC0Lskkr4xSaG3VWzdAuo61n93
         5osLZywqMLxLeXH/SI8O1LzdE/OfzB1V9WmNkPySDEJzbnLcBTFpLhJXqInaWefuZZ4i
         nXBgQbfUakJ8tda/d0wC6zXN25X8kWnWsca/n4piHVZzlD2leSJU0mkz6VRTtU/mNiSd
         9vHHRbzNpskW6OP+Y5IgbxEQcL/W791fS2u9/HatX8CQ9Uhf/soCcb6SbD7KCnqEXZVp
         vOzjm5VerQl1OyXbYW/cUDZJzgziE1iXeoQ4Tr+kaZrR6kMAEMDq3E/Uwrl8LDpBqWfU
         baQw==
X-Gm-Message-State: AJIora/BTEwF158pj2+JPrW/Mh+W87Gubyi5Wkii9J75WHpEiY5ER7ei
	APa/1dJaQXEJHKXXi/1WvEcCJaxfs8hRSA==
X-Google-Smtp-Source: 
 AGRyM1vsiNEuGY7kYtAJoqQeCy46Sglhtc69y2mccx34S2hqNY4N1CmBHYXeCxwVYPPz8iMq6WfHOQ==
X-Received: by 2002:a0c:e10d:0:b0:473:1d:d6ce with SMTP id
 w13-20020a0ce10d000000b00473001dd6cemr17722875qvk.36.1657636075688;
        Tue, 12 Jul 2022 07:27:55 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a05620a0bcb00b006b258b73eeesm9028707qki.120.2022.07.12.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:27:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	robbie.cao@arm.com
Subject: Re: [PATCH 0/6] Refactor runfvp for OEFVPSerialTarget
Date: Tue, 12 Jul 2022 10:27:49 -0400
Message-Id: <165763606924.3923529.2623314912103237139.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:28:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3562

On Tue, 12 Jul 2022 11:28:24 +0100, Peter Hoyes wrote:
> Please can this patch series be merged into master + kirkstone.
> 
> To enable creating consoles for multiple terminals, refactor
> runfvp into an "fvp" library in meta-arm/lib, which can be used
> by both the runfvp script and meta-arm FVP test targets. Create
> selftests for the fvp library.
> 
> [...]

Applied, thanks!

[1/6] scripts,arm/lib: Refactor runfvp into FVPRunner
      commit: 306639bbd5dbb46d257c57342cb8980c8e0468d2
[2/6] arm/oeqa: Add selftests for FVP library
      commit: 5ec49f964b01826fb9578255c1b85c8ef001b09d
[3/6] arm/oeqa: Refactor OEFVPTarget to use FVPRunner and pexpect
      commit: b3ab04f81305e108db83013e2e38cc465b28ec4a
[4/6] arm/classes: Change FVP_CONSOLE to FVP_CONSOLES in fvpconf
      commit: ff90c8ad54ebba9d1be5e137009e00ae0734424d
[5/6] arm/oeqa: Create new OEFVPSerialTarget with pexpect interface
      commit: 30b1452025c4b62de98e1514223a2ff483436ce6
[6/6] arm/oeqa: Use linuxboot and OEFVPSerialTarget instead of noop
      commit: 7f611a0d2ebfb2d52fa52afe27a335cdcf7cec70

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

