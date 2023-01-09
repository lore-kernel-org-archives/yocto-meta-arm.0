Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592AFC6379F
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:23:39 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.76865.1673281417555191648
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=TAFCNKr1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.52, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f52.google.com with SMTP id a64so9174411vsc.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 08:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZq4ufwwFarLNzEoGAdoeOtnRasJm0oQEYyFimXA9cY=;
        b=TAFCNKr1yGQAZ/5QTyL4u9BjMRnz6y1HJZj85PxEpx7KuEbZujvCrWL2QcGUHv/kWM
         BsBFYgLfxKCF8mJSva+nPkaus7of1LRPsdsAAK7iNRANvVLrk2XF9uR3FvxtQf8Q3TiA
         jDVjb0cvDPApdJ3U8WeBOrM3KjwnAMvWD6PFNsA8W/tXk8Z1caBb2Sc8XfdD2piMN/4q
         ItVkWyh8ifrMiAOFv77qewDBMouT2RqzveIFnXONiHymcOZ3T+IQTuzKts/mcMbzLWfB
         0y23jVlnmQzqGtNuanS9lHGET/0L+C1cabJeqXfwI9PY21m0mLAyeODD5TvLEXp7ukA1
         i2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZq4ufwwFarLNzEoGAdoeOtnRasJm0oQEYyFimXA9cY=;
        b=lcR3Vn9NLdS5DnRGaFnZrwBQ3sXXjYDtHinlnrqgoxpBSt7VKwdSv7e7mqJrGHL2zt
         GS32X7NBVOO+ZQebMHPkX1y7oHSvFba68z6nWAA0RLg3Btp0CH4vPH3V++33AO27rvgw
         2uR8SXatPTQAFSVxpPs+CqERz+L5FBgb6Hy+9hXoggRYNgCfPCyzyQDCcbRq0eOV4ey7
         +1nnSB0y4sJ9Xsi2Uunr3eoKS245rjCPjwTz4EF5aaYXgq/TJQ0gDGPdgBM07js6kfJr
         loT5iORICiivu/n13RAy0FWS24QyNrELY5ktEROhsuzTyowX8TP+ZSOXyWKzHvhEBHfY
         o3Uw==
X-Gm-Message-State: AFqh2ko8S7rcF3buU/CL0DSyLiMptHT887SohqCYscf37etRxFAMj3OU
	Az0zNdR6B34cx1fDnl9SCsonkivGbO2JyGJF
X-Google-Smtp-Source: AMrXdXsPT775cZUlUyW+5kQ4Jht7HyiLzqnKVLlLc0rulDbAfuOOzatZnD4dKuVF43hu+H9vJlE2VA==
X-Received: by 2002:a05:6102:2f1:b0:3c9:ea42:8042 with SMTP id j17-20020a05610202f100b003c9ea428042mr24726503vsj.8.1673281416147;
        Mon, 09 Jan 2023 08:23:36 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id bk25-20020a05620a1a1900b006ff8ac9acfdsm5616799qkb.49.2023.01.09.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:23:35 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] gn: Replace lfs64 functions with original counterparts
Date: Mon,  9 Jan 2023 11:23:07 -0500
Message-Id: <167328138753.3677955.15218444739439250844.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221222084850.158641-1-raj.khem@gmail.com>
References: <20221222084850.158641-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4243

On Thu, 22 Dec 2022 00:48:50 -0800, Khem Raj wrote:
> 


Applied, thanks!

[1/1] gn: Replace lfs64 functions with original counterparts
      commit: ef20a1c9b5069e9b7502b4a92dffe872e912973c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

