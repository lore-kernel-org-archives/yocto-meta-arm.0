Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D4C77B7C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:51:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1800.1684975914343754805
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=T7dbqyxw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f6c014d33fso2089011cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975913; x=1687567913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw3Dh1UnoJTjqcaQuFQtp6YnSTXH9pZp1QK3THaXk2A=;
        b=T7dbqyxwG5MMcIyPYG8u0rl2TnMT4+nXXGyJL4vnPq21f8AP9s0JFBJPAdFnl8PObd
         JIfmcJxyoDZLpuZaIyVzdzUsttE2gEs2i/ABB9nQF+6y8bXBUJROI0wHgrJpqbMXI1yI
         k5QKYjrL3DmIL7UgEI3Z4G0sv01T+gMEMGprOQdJPWgRD/nHdVIjIcSGk4KCwq0eDYUc
         38ESmlrAkmCa610a+gldh76yquVUHevjnxEq5VumYwjYufAFVyV4Z1YxsMs8SHkptaQ4
         xIyWa15sxnqt+OChu0tjiTaGh43EMtMQVdHNm4B/37yBvh3dI4rdNDVnKicFHp12GITJ
         s5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975913; x=1687567913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw3Dh1UnoJTjqcaQuFQtp6YnSTXH9pZp1QK3THaXk2A=;
        b=MvCmhGIRKAWmEPXockz4f3B20a9Y4kNwAg8g9wlJoAnsjo14OJXKPgDJveLW+HMgg3
         367PpxgJXuq1Kdm5WoCYwWHBuM/O8BlfyfHrKpLMSyHtX2s0N7+FaJae607TwnXXGrmX
         j0v34GC/fnBYrWMKJhUm9GVRsyh8o2kfBc6cIG03lM/dkizp07DO1mY7W4ZdPRTb93ya
         EJ2Deebb0Er9OePusnKRshzdSJ5pRIkuKIBIoL2NfMGXN0BXHh+zz8fMIG7rSw8y1YBA
         DTPeXZ5XAEIioTC4A0Xz+LDstgFTEWr8wLD80WwvQ04ah/JexZacGb2cUcdji7+axW8S
         AiuQ==
X-Gm-Message-State: AC+VfDyQTcAy1QSJxtXQWm6aAZhCowiracFtOVxkVFAndtuEx9c2we7i
	OQZXJUEKJdEvad4z4YSKrjB6t6Spe2I37Yhg8x0=
X-Google-Smtp-Source: ACHHUZ5nLqp8EdpmhJ8loWD9pwIIvnWSzrcSngPuHM21HqL2+Cj7X2SjvFwcaAJ1XQkILXJLc6PcXA==
X-Received: by 2002:a05:622a:5d2:b0:3f5:3f9e:ffce with SMTP id d18-20020a05622a05d200b003f53f9effcemr28019457qtb.43.1684975912990;
        Wed, 24 May 2023 17:51:52 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id x7-20020ac81207000000b003e64ea3faf7sm4176142qti.59.2023.05.24.17.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:51:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH 1/2] arm/lib: pass the PATH to fvp runner
Date: Wed, 24 May 2023 20:51:34 -0400
Message-Id: <168497589902.1985833.1745164066225029435.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329120057.58949-1-peron.clem@gmail.com>
References: <20230329120057.58949-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4695

On Wed, 29 Mar 2023 14:00:56 +0200, Clément Péron wrote:
> When running an FVP machine the model executable need to be found
> in the PATH environement.
> 
> At the moment the script doesn't provide any PATH to the subprocess.
> 
> Add PATH to the allowed environement variable to be forwaded.

Applied, thanks!

[1/2] arm/lib: pass the PATH to fvp runner
      commit: fa598021fb387e98bdb80861f245cc15acde4ca5
[2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
      commit: 316e02c0f13b473e916cd779e59f0d55d48e4962

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

