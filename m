Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435D5C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:02 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.1973.1667847895352640696
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=syWob8zJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id z17so1441927qki.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvsVsYVvE04+cYI02hf9U1dWD9Bxg/Diwk/2HlZhY5w=;
        b=syWob8zJvufHH/GFokM3g999S+O0G5j7E9i3F67MGzQ2nN82luBDic2nzgOKi8dDEp
         vdis6qreb8JaiSc242hBHY7L9zUuG/zFveNrHL9TblEsDf0cmy2HVGUcR0PDZ8gAG7gO
         qAPcDJEk2xNVAVn2eCh0g0UCwr9fzUzrjZ4uzukT3uiEwQq2MPdMx7lKaUU1wI0CRtM7
         PxOs9wIBjWaFIjqjV0FLn+IYQbc9Zio42L19NKUw5P6/4rGe1RsS5UmGj+e1FQ1PpH6j
         D9uzgfymlpASGXrobcDmG6flfeieJoGWq5G2Navqdqmger6Mxqy+6vTULBpRDsFI6toP
         s1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvsVsYVvE04+cYI02hf9U1dWD9Bxg/Diwk/2HlZhY5w=;
        b=ko4dWTtReLCEPExGGUWW3mrXMeYSBM13Q0oylcXrYAx7lv07GBU/hF5JBPw1iEnUrU
         QWZFgWLH1seSdBQf8xE2HhvF48K6Nmtfttsy92SC6svk6rYjlLQdJq9h9GEPQpGE8LBE
         31d2fLxtHEEDlH+nWADnPMw6GtEbNzICH9OLgK42apgTwnfCEGsSqYpO7ObADG06tipH
         NnbVmnsG5LcjmH2G0uyfIOTj1sKav6R90eKASUNpUjUfOwHxf6SyUrI7JzzPbwXtYtYJ
         zP/gFpBBEnqFLCZNQu+auhk9JLbtY8mMPgE6/1OBjyj58QJf9uQd07ny9KDQmfsMMxjd
         5D2A==
X-Gm-Message-State: ACrzQf1pU7wJEPS5N2A2AEzTOQ+LogjDK3O6Gv7NX0yOd9+nV2veZ6Md
	D50k/bQyfDn4bIL/6+oNqzCYSnzM9Nhgxg==
X-Google-Smtp-Source: AMsMyM5iEShatm2Syl7dBUM8+LIkzINheI94PiS0q8lG+3nB++hmd2OAmeFfG9BvPp1PMwrYGvqnCQ==
X-Received: by 2002:a05:620a:1256:b0:6fa:4c67:4d9c with SMTP id a22-20020a05620a125600b006fa4c674d9cmr24715496qkl.713.1667847894058;
        Mon, 07 Nov 2022 11:04:54 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id m5-20020ac84445000000b003a51e8ef03dsm6582684qtn.62.2022.11.07.11.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:53 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] arm/trusted-services: checks before applying
Date: Mon,  7 Nov 2022 14:03:54 -0500
Message-Id: <166784783591.2324924.1481970451750812664.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107113858.48177-1-emekcan.aras@arm.com>
References: <20221107113858.48177-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4113

On Mon, 7 Nov 2022 11:38:55 +0000, emekcan.aras@arm.com wrote:
> It fixes few issues regarding ts patch stage.
> 1- Adds check if there are patches to be applied on psa-api-tests.
> 2- Fixes psa-api-tests (crypto and attestation) for corstone1000.
> 3- Changes default configuration on tfm to accommodate changes
> in "2" for corstone
> 
> Rui Miguel Silva (3):
>   arm/trusted-services: check before applying patches
>   arm-bsp/trusted-services: psa test setup corstone1000
>   arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-services: check before applying patches
      commit: 3651527f577ea24bbb1bdcb3ef0705235a0e536e
[2/3] arm-bsp/trusted-services: psa test setup corstone1000
      commit: 9e2de7dacc355fc3def8bf54cd2d14595037c438
[3/3] arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
      commit: 8d35c5b5396f80523e73c493c936f60c8242d00c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

