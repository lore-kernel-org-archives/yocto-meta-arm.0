Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7734C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 17:56:47 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.980.1718733400140365064
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 10:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0eQbr8v+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43ffbc0927fso30193931cf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718733399; x=1719338199; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obgfjk45/Q791GT3oRjLrrcoQmrXGpIXM9MuKTbDx6w=;
        b=0eQbr8v+l4GGXtEQkNBz/l2tst2O49ALVhm7IiUjNKDjvT8M79RnriSKnyKuhmTbiX
         twMBudgoWbyD4hyaH3ZToxBjNddYExmpN62FFtT2KMb3syEj3W9RTqoJ1UtDwx4sxqui
         wINrogb7Kfq5ByKK/CHFtRJ0gFzZLn+C3gGyd+ERg1BuL+WJu1e3lNlZd724AS1PgDPB
         5RZ2TCwXZpTSfQJhfCWjXIegSCBu0ycxu2/6ndpKxxIK3oomXrWNiXP1QpPqZonDY/P/
         TJ9JcC/MjDbL2zWGcXXX1zDO2OTubYlBMhkLq0nJzQEBbGTVcmC5hSHeIPUitqkwMf5S
         jPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733399; x=1719338199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obgfjk45/Q791GT3oRjLrrcoQmrXGpIXM9MuKTbDx6w=;
        b=sZ5+8pSSw4OtxLTQlut7mQp128SlFzjL9t11faWs/ubDR/fFTmOKCJNJcbvF3efjmi
         HlJpeRQjypwQRly95ixsjAP6vmzICqeguT87rZtPFJd9U2KHPkmYQJjphv4Uk90ymSob
         BK5cddXRbZkfZvHTW//a9vY296J1ZNBJDKEOildgw77sblKL/cVldOJCckG08U8nhVrL
         NRr8K93C1X1GHpN92NmCgPpBbt7MiZ5KJibjNACcvFeRQfsi8+EEK3fMPQQIlKdh2O32
         ChlLVbM6cg7mauCAbzdJVgkpKUjWcwLXaoFacRIv6LTlP9uq3YoPSttTnrcSRvIxEaTk
         A1fg==
X-Gm-Message-State: AOJu0Yywis1m9u1BffkNuHIe8i/Z+BhHeReDeybb/V5OTjldJeRAZktB
	LKviCVDc7I+7aL9hnSRxAbJFeb+LF77DgfRnsQQVxGeojQqj9Bf+XdaDM5EEq6cDqtvevMvxsC0
	=
X-Google-Smtp-Source: AGHT+IFf+nXwsC3SKMuYy5gctuTiIs5b52kbXdjbIwvOEf4keXggdbtItSaMCITNk/9XQVVv0OND0Q==
X-Received: by 2002:a05:622a:103:b0:444:a783:8043 with SMTP id d75a77b69052e-444a7a3cee3mr7269911cf.24.1718733398866;
        Tue, 18 Jun 2024 10:56:38 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2ff9ef8sm58221651cf.89.2024.06.18.10.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:56:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: Re: [PATCH] optee-client: Switch away from S = WORKDIR
Date: Tue, 18 Jun 2024 13:56:09 -0400
Message-Id: <171873337046.2601380.276678688711417099.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240528202916.3082271-1-andrey.z@gmail.com>
References: <20240528202916.3082271-1-andrey.z@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 17:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5830


On Tue, 28 May 2024 22:29:16 +0200, Andrey Zhizhikin wrote:
> Since OE-Core commit 32cba1cc916a ("insane: Error for S == WORKDIR")
> usage of WORKDIR in tasks is fatal, and shall be replaced with UNPACKDIR.
> Similar change is introduced in OE-Core commit d9328e3b0b06 ("recipes:
> Switch away from S = WORKDIR"), follow the same pattern for OP-TEE client.
> 
> 

Applied, thanks!

[1/1] optee-client: Switch away from S = WORKDIR
      commit: 30872ba12abaab0a53e332a33429e602be30e249

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

