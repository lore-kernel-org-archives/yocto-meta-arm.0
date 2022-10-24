Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8BFFA3740
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:18 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.20551.1666625235250606865
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=BYauHmZN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id bb5so5778922qtb.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4Iq2YZy6eJwa/u6rBjlv/vmit0WvoZQ9a+XuUQSCv4=;
        b=BYauHmZNmXFf8PaILzSzhcww0RJqcAIfHHnceb/XYKSKCktwqsB+ymnfPrvU2tQ2gU
         jvXub9ek9mJFOR531qNyOMmwGvgn36dLnKqm2PQ/xeQOENnLU5aeR9vfyyYW22Haf8TH
         1JnpQkuhCk23vl5jHRAwdsc0gT7NDA9PlOS9xXDV0Jhzt7UfdiioCvwzK9iWhnq2Wxhj
         1KIQEE3ighgvPZz1YWc516utlxGqpDKOBNovJTSUnIk2VdSuS/y7m3jO9nBHwGLJCj3p
         ySeJS9BDJoabLIvAbntwBdGsJl/S36AxdaIKm5X8AzPKyA6H6A79wqBek/ZnODUdt3rt
         XzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4Iq2YZy6eJwa/u6rBjlv/vmit0WvoZQ9a+XuUQSCv4=;
        b=In+byprLzyNmJc9LiirBP11pISiHlj8vRmRH2nek6v+11RY/B874A7ciV4LhpCSWNe
         XjWSSwbIVKIkeyL6UHd5QMlkg3ZcVm5SXl+RInXIge2xqin1+7fzqQ/WLz60gNh9oyMh
         gKC5N0kTQtyDakR5ESbiTcYRV/wu5cNrgYfc/W0XQikAoFhTEQbU3nLLh3wTIzIBH4sz
         1mHPqFFlbLlhLugGHdEO0kBNNBnggIY0Ivfz7v+bMaUI/gPVs3y8kpBjDjaPqDrc5yLP
         bXj1iC6/7CyXrJQLBW4UD7uketsppL9Jb9eeEaPzypy+XuEKIpRurn8JEv1FS7hU1gzL
         jEcw==
X-Gm-Message-State: ACrzQf1lzUe8rAIFOwYHgnrO32/iUhWIZIaBFyzCxrxVWQYWailAz4SZ
	nkndDBmpYVV/17CxhC3YmUbBwdGZEdiKOg==
X-Google-Smtp-Source: AMsMyM4w5w5mLW0vvF65BMS1Qjt/15MQQgAJGU1ulrxfR0LLd9df10NXsUFo3bWmf04GcvYPH1u4wQ==
X-Received: by 2002:a05:622a:607:b0:39c:e9b9:c043 with SMTP id z7-20020a05622a060700b0039ce9b9c043mr28558073qta.300.1666625233914;
        Mon, 24 Oct 2022 08:27:13 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id a1-20020a05620a438100b006cea2984c9bsm109993qkp.100.2022.10.24.08.27.13
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:27:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:27:12 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm dunfell update
Message-ID: <Y1au0PgdVqbQtET5@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:27:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4023

meta-arm has released an updated dunfell support tag, 3.1.5.  The tag 
contains 3 patches from between 04 Aug 2022 and 21 Sep 2022.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.1.5) with a yocto-x.y.z tag (i.e., yocto-3.1.5).

Thanks,
Jon

