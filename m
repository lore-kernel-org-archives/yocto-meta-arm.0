Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE2BCE8362
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:02 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.58994.1727713495567209548
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=O2OmnTED;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.182, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d9f65f9e3eso38744127b3.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713494; x=1728318294; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x7oD1ay5sUaAmg/eQga728YrLebXctCjfTCZrYbwZQ=;
        b=O2OmnTEDa03cer7okyz8e66dM7riSN52oEvogeVh1+4x6qDKackILHTZadeUladIJH
         6LZPpy0ZapGIeZLSZDGO/pNQV6vSuxm9dowDPp9IN2q8cHOFpL/MukMd4VGfyhvQeP39
         PxZlYq9UaT8Rs87Or+h3WzxOCu0tSYiZRTyP3sfzAy4DN4F8wH9CVH2lnI1gqwqF2eZy
         oyKXBBmNPIRBHyDqMO90moQvyF7EWsRk3JnBFDIr7CCLGquUTxhXUSliYoCC456HkgN8
         wPEsEn2OdESYK3WTHzsvTUp2FC/7IVjzpiAZcApuE6Gjc5BWieYUqP6JSWEsAjKv//gx
         Y7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713494; x=1728318294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7x7oD1ay5sUaAmg/eQga728YrLebXctCjfTCZrYbwZQ=;
        b=PGOVx7xIg5jJitJV/N6jNpYXtXd77QTHCKq7DcwLAS4PcKxtEjx4PzHfT85srGu9iI
         FGAVu7IMBXFzeGael/8u/3uls6GubR5ss6ZuHH+wegDdBljth5d63CscnpElCUdgjpFI
         j+U5P5ebaVraUfMZKZojybj6gYWgjoh+NzDNz3MhpmDqNcZJe3YnDBNn1DIvAplPso8d
         iunzQHFWmZ6BPi336/MT938WrpRABh49oCWcvVMOeU6JmgzfEWz+QVYev38K09GfxOed
         t/BkdYPWREwFzzLSzEFf3HF9StuW93wNL4E9goScZrPl/3QttsQ8EwvfI+9gi4Eh6lg0
         RSzQ==
X-Gm-Message-State: AOJu0YzhV/ZhVmxFztS5Tst32qqUEqepFnJK0D77gq/uxjGX6qU0pjFU
	xEd9knR3MFam5XQPhInhNKJTwEAgszvC10sEv4vnwjEIOAGJVwnmNC3IDPxUtP/G8XHOgfC0ZDI
	=
X-Google-Smtp-Source: AGHT+IFq0Hb6Xw6HciFJWxZ9t6b0oGYAydjoCJeZjf1xFy13rffIfYAHMMWD+7E/53XdY0vBz8+jhw==
X-Received: by 2002:a05:690c:2c13:b0:6e2:5a8:3447 with SMTP id 00721157ae682-6e247587004mr71419837b3.26.1727713494559;
        Mon, 30 Sep 2024 09:24:54 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2453882c5sm14412097b3.109.2024.09.30.09.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:24:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] add basic b4 config file
Date: Mon, 30 Sep 2024 12:24:32 -0400
Message-Id: <172771348140.724488.17189183259615434189.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926-b4-v1-1-5c1002121c32@cherry.de>
References: <20240926-b4-v1-1-5c1002121c32@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6142


On Thu, 26 Sep 2024 17:14:07 +0200, Quentin Schulz wrote:
> b4[1] is a very nice tool for mail-based contribution. A config[2] file
> exists to set up a few defaults. We can use it to set the To recipients
> to always add, in our case the mailing list.
> 
> This shouldn't be necessary if we had a script that b4 prep --auto-to-cc
> could call to find the mail address(es) to send to. Let's start without
> it for now.
> 
> [...]

Applied, thanks!

[1/1] add basic b4 config file
      commit: a754b2beac4d97dfbe1dfc5153d28fcd9bb1fce0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

