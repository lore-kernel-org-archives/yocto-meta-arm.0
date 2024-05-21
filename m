Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0443C25B7A
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.20880.1716301240546259349
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hZrW3oMe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a3652a74f9so20170086d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301239; x=1716906039; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6PGuUbpinxNit2VUSjLEde8dsJdgOFZervV8uExLB0=;
        b=hZrW3oMeDKATS44fX83uLDh2Xg1EffJIdlf1i2/nExpLJ0s1AKQSL5sNhj+yCTBvsg
         z2UqsP5xtuW21c3miPKbRF6Jlc9a+RW5SW6f5+FG8udiLI90o4y8aYJ89/xf7EG66X0L
         7mYS5TUfVTTPoBGXaL2EqSFVZqWo148qX4jxkKqyIGWAoSrTox8Stbv01IdeecobfYb/
         lCqLK6wWTPBa4k7rnNcgo9oEX2BiNjfUha4hQNC8Ul8A2ElbZGpgfa+XVpHXulvcpby/
         d+CFJGdcOP1g8ed8vlDgIvZSU/k9BJWAmDbWHotDfYRR63zrUnRQY22jL7xHeJpplLdF
         KmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301239; x=1716906039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6PGuUbpinxNit2VUSjLEde8dsJdgOFZervV8uExLB0=;
        b=CrHJuQqn/D1s46fna8Mdz2a1V49b3G/X/SGsXBfjXTd/BEm9ypuI0Gpmy50qNCjhcG
         kngOw7N/pqE7Ti++HjVX+1Mvs5+wUHR78f3fH3Y68Z/w7tPSzx27MWrzZsUUD5pNNHcy
         6FHhk1aP+DW4gq/CNcEwP9oyfpVT4YgHSWYwQv8oUSjjVyL2CVnAQC0qMAYcrK2vHngO
         5/8Cd1YN6QR0o/EVMyCgHOSQb327CGbEgvAW1L0GaFOxDxG4y4ZS2F22Fz6BzVSNTVVM
         6s6DD2v2VPzQIHHw7/JKnAy6oBgTjHfeipxS1LTq2WCIJhXhFd6SgTpSyZ8/gs0+41z2
         OUeQ==
X-Gm-Message-State: AOJu0YzM3AqjJgca2NVP6DWia+/gstRA3b/pDybQY9TY+K5EJu8CGlsT
	Hzfgu84LIUG+3m/4Pbf4hiz+VgZYt82DaAVzu+bZ6gJglCBGHs51NcdfC9x0mNcdKxfPWyC+c2E
	=
X-Google-Smtp-Source: AGHT+IF2oj4lEcS1R384AuV66O4y46QYBeFEAT7TuMzugftH4Eey1N0ppddKLv8L5Mw7LF71EnTRhw==
X-Received: by 2002:a05:6214:3d97:b0:6aa:3700:d247 with SMTP id 6a1803df08f44-6aa3700d3fbmr79975816d6.25.1716301239472;
        Tue, 21 May 2024 07:20:39 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1ce896sm123516426d6.92.2024.05.21.07.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ben Cownley <ben.cownley@arm.com>
Cc: Ben Cownley <baicow01@e125927.arm.com>
Subject: Re: [PATCH scarthgap] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
Date: Tue, 21 May 2024 10:19:48 -0400
Message-Id: <171630119064.2318166.17302025128010368682.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240517150706.76980-1-ben.cownley@arm.com>
References: <20240517150706.76980-1-ben.cownley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5742


On Fri, 17 May 2024 16:07:06 +0100, Ben Cownley wrote:
> Upgrade the openSUSE distribution from version 15.4 to version 15.5
> openSUSE Licenses updated to reflect update from 15.4 to 15.5
> License now includes: Apache-1.1, BSL-1.0, IPL-1.0, Sleepycat, Zlib
> 
> 

Applied, thanks!

[1/1] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
      commit: 8097a792db82326d44b71c019ce94c00ca6f7e01

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

