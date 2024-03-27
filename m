Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7ABC47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:51:47 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.38153.1711547502022788118
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 06:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FrHDgwU1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.177, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c3ca3c3bbaso1983044b6e.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711547501; x=1712152301; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9/QfI1tNxvLPy5/2kgiYhbbCTOcZM3GuIgv9EEXVMg=;
        b=FrHDgwU1G1o3cfZ0eVFai4eu4aStNbj3/roXqRM+447lr8oqbSu/MBr0e74QnZ3ngl
         Tyeow/qgkbcuoIeWb1tRJIOrQmvAXQ9aYkIg9BXqWJLGLIdbCUb4uwLKcv0ClpP/cQgT
         h9mPYTDAeFdqaLRGnqhjzlMFa2scc1WlulsNSTzhDh/D/EMt7oA1uDmP04jgRWPM+I+X
         95omHSFVM1uLaAv9d4KJVRYg1yxMPEG4Q7vyW8/JnUmnUySVN7q+OqTK5r3dFA/h2l5y
         kTULCLPE4LRr54p3kIIoCk4famsPvX4n2ORT/w5tO+Oeq5W40QQet95g4Bmotvgofch8
         IvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711547501; x=1712152301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9/QfI1tNxvLPy5/2kgiYhbbCTOcZM3GuIgv9EEXVMg=;
        b=GziEX4N93owttVnfZw+4GqF5JcJc01ntnt9v8FFnb3WwDkJ5tU5JdlO8UsCoVAIDik
         wQBT970exaQ8ycEa+jfq7c+o2PG36OwqERdvkw1NfzyNcCwLI1jPRkkL/AOOcDvJbLMi
         UPaFqy3ah773OJncD7vzfcFzvmfTDy6koWdGKH/He2oSx8R78N//bheuenvUI4hwZqsC
         0gcNaGfo2g8Lc+3lpGGFeQx31I8pJgIDR6VEsaPMN1frJJvV29n3zVbCtJDYXiyTmuKE
         5+Hyr9nPABVgSbWes0UaZRd7GcXLT9xLZ7fVdkogGovezpjhPfbo8AGZW2XWJSPWSzED
         xfuQ==
X-Gm-Message-State: AOJu0YyRCDP0tqxYK/qyH+QpDjji5uKkL/r4a4mrw8iZAh6H6qX5XUUp
	oywyRakmTKdcyZjCmmAS9/I3Tk4aWGrA6QVYpDIOlUvNET0cKiBM/5KtTrgvdwl1BnJDlOzcTdQ
	=
X-Google-Smtp-Source: AGHT+IGlhE43T0vBoh+loX8xkx7J6oi2hTQAPjWR6mfltE05AX3eKo9jtykqxW/EOyBxvIRbWZpMnQ==
X-Received: by 2002:a05:6808:38c8:b0:3c3:d385:5cb9 with SMTP id el8-20020a05680838c800b003c3d3855cb9mr1924783oib.27.1711547501091;
        Wed, 27 Mar 2024 06:51:41 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cn10-20020a05622a248a00b00430ce167becsm4786931qtb.1.2024.03.27.06.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 06:51:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] CI: ignore netrc warnings caused by Kas
Date: Wed, 27 Mar 2024 09:51:26 -0400
Message-Id: <171154748601.477140.15396916728657327843.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240327124854.1214719-1-ross.burton@arm.com>
References: <20240327124854.1214719-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 13:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5494


On Wed, 27 Mar 2024 12:48:54 +0000, ross.burton@arm.com wrote:
> As of oe-core ba391d3, hashserv lookups will use authentication from the
> .netrc file.  However, Kas will write invalid netrc files with comments,
> which causes bitbake to emit warnings.
> 
> This has been fixed in Kas in e700729 but until Kas 4.3.2 is released we
> can ignore this warning specifically when checking the logs.
> 
> [...]

Applied, thanks!

[1/1] CI: ignore netrc warnings caused by Kas
      commit: 2271e337667ae04e6a451835915b023a68a8979e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

