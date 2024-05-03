Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAE0C41513
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 15:08:19 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.15589.1714748895486726743
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 May 2024 08:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RrWWP/Tj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78efd533a00so640321885a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 03 May 2024 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714748894; x=1715353694; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEzdEfuQPIHFjwVZx1+ArxTsOekETwjRL96/lQQKVLM=;
        b=RrWWP/TjWP8uyisNaIu22Sw2f9LQxKsl8c6yqh9TPjUXWTv0ApKsp2eS1H8ypEKqXG
         2QV7tMfVjtX4lUepCMIeU/ZgxwSaqsjYiRSxTYR3ln4vK0W84MzQmVmgtRi52ckkZNK4
         eKvUfNXRg/kPgyj+nvC1Q48y7lf4LdSzhFxNvEqmvh/bs1jGv9bCtcjhbQ3HLvZHrKFt
         7sxo9xNpvTHWni5eOi8W6jaoMtj0uEkqgHpoGuKTFTOEpcsWLI8OA/BA52y3kMB88Ymj
         qEM2dI50fmceevTO6ZF8qjpxYuy8DLs4RAyDGL3tiK9RA9441gSuzqldcKEHlYkOcgD9
         TfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714748894; x=1715353694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEzdEfuQPIHFjwVZx1+ArxTsOekETwjRL96/lQQKVLM=;
        b=W2xiT1zbmkRU84z9ua9Ufh6QxCLtzzMlOoj20hEM708hlm1DLg0ydjDTB7H4NkGDQH
         a/yB7HGYL4eWgoEhcNkAnUNC/ugf0UBQmDp4JmUPI/1jV/9kfu5LSgnTHyF+xyIDK/Pa
         +ABB+pnpdNZSBw+XBDPhnUOai2WfJNHFz6tKingD+8B+1GupiDuPxjnG+jtRlX4aNKm4
         O8uH4+X6LyNKcagc/kTbFyrn3lOnaPqiUs5Fm8mC/2rERLWmGXc+9GnzskAbuUWiFOeJ
         LCCp+NYb6DQF010URinVF1IAkcIx3/EVzSZ9vaNtm4QME/eHixKJSKrAIihBHSSRG1Bs
         rv4g==
X-Gm-Message-State: AOJu0YxgvW/tSO8R/Ok1y7SfIIBDFrBCFJXkxrSWsqFmnhn6tSAx1tJN
	fQ2iqXyalIT3iA9gse5jDsfnrUx41vVz3KlJTjl/68o95MWgD2xVE/f3xobt7vDoDShbtxMHWwI
	=
X-Google-Smtp-Source: AGHT+IE+nJY+hK8VLHTzmYmRjdc3VsBp6XPDbRo6u+/LwnO+/ZSyfnsEovXdBLj0IbhWMBgRe0kc3Q==
X-Received: by 2002:a05:620a:1270:b0:790:fec0:e205 with SMTP id b16-20020a05620a127000b00790fec0e205mr2831657qkl.26.1714748894336;
        Fri, 03 May 2024 08:08:14 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id z8-20020a05620a100800b0079065de3c96sm1304179qkj.81.2024.05.03.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:08:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/boot-wrapper-aarch64: use https to fetch git source
Date: Fri,  3 May 2024 11:06:08 -0400
Message-Id: <171474876814.71176.5687354373476839155.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240503134452.3990465-1-ross.burton@arm.com>
References: <20240503134452.3990465-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 May 2024 15:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5695


On Fri, 03 May 2024 13:44:52 +0000, Ross Burton wrote:
> Some networks limit outgoing git: traffic, so use https:.
> 
> 

Applied, thanks!

[1/1] arm/boot-wrapper-aarch64: use https to fetch git source
      commit: c9c93da0dd647c9e2bfea238bdead1e0efb526ce

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

