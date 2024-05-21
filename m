Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FD4C25B7A
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:35 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.20881.1716301235109887552
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LlHppf97;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43df44ef2f9so29117031cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301234; x=1716906034; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vle6AorBvHnfTJ+SVa4MEF77wguTyNk4sBE7uRsn9PY=;
        b=LlHppf9719OTsVzAHCVnOzoCUAcKWwq9Ywz1U4T/cpbz60BnQ1SNaE7qHPqfQt4BNC
         5/EkNv/8/BUZ9QiYik4ijezjDrsJj4duqMgbnQOuzfl4rUds/t0gpuyjVHpT728o+JO9
         kMf+aeNj8hQB9VmRfitm3/arIKJe73Q8jPgvYUuQxA8pROTShIZcxbMHTS/O/u1mVEcn
         HG+GMkKBcH2LBbR3xzYj+ocOobI3T5W9OIDUdEXfpt2SxaMjNHmc8lhwFX9jtF8tumdS
         1Z/Py3+JKA0cCCDUNxp1Y0FRQ6KOOGLL9aNrF/NOyimv+sgclbcA7V4zPpmML7LSP2sq
         4KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301234; x=1716906034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vle6AorBvHnfTJ+SVa4MEF77wguTyNk4sBE7uRsn9PY=;
        b=rTMtTSmSRb4bnt40x+rx4WEbVn4+cDXkVJIxvRm4usnbegNdyJ+JoCX8wDUaf1rWWm
         DMXCL+ffcEVPFHTNqVkOJCi0lrHhAX9cjU6iFsxMxzwFVerKPBhioWKCvGtzeqXI4yca
         NLnOzKEH7wcbyVPnzfuRwY8jF1E7+8KYO9vasUdEXW/1u3IcHnsA9KlZcH5PUOiBlD+7
         8WDCRYKRsPtcuksPSkjK7B0ryXu/lY9y5NVD1PtCdAApmT6D0EQc82Pz4PJVYR266P5h
         HOgL1FxaQKjyRwNS8/wW8NWXmD1weNyeHf9nE6IV830zd2su6y+6W6BmD0MJCPc2H+gC
         8tXA==
X-Gm-Message-State: AOJu0YzhAiCDEnt8mUXGNnxaRvR125hO7vdR2L4kiOKgNztkZH+dEgEY
	ycv5VPwZemm+OxUD9x+mxbYq1Pp/4+UfyFu+KL0TLcuKbMogQ1nUN4Lb1ISriND2864BHgC9s+k
	=
X-Google-Smtp-Source: AGHT+IFtnpp/ZgVLgZhfLNbiMkfL33jVEwl7k6rD9CHdheCcm7rlHaJPAd6UV4Wb/GcX29Fa3wQYhA==
X-Received: by 2002:a05:622a:48b:b0:43e:3d52:3e12 with SMTP id d75a77b69052e-43e3d52440bmr154445741cf.35.1716301234030;
        Tue, 21 May 2024 07:20:34 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf3106c2sm1286824385a.106.2024.05.21.07.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ben Cownley <ben.cownley@arm.com>
Cc: Ben Cownley <baicow01@e125927.arm.com>
Subject: Re: [PATCH] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
Date: Tue, 21 May 2024 10:19:47 -0400
Message-Id: <171630119048.2318166.14129298621587428496.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516095951.32196-1-ben.cownley@arm.com>
References: <20240516095951.32196-1-ben.cownley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5741


On Thu, 16 May 2024 10:59:51 +0100, Ben Cownley wrote:
> openSUSE upgraded to 15.5
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

