Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC36C38142
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:01:25 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.64868.1674180080442407076
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 18:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=tLBZVC6I;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id x7so3129329qtv.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Jan 2023 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lev0Uzl2NB7E1zKkmfg7ofns5O41TRft58FfmsFp6jQ=;
        b=tLBZVC6IE203yNVraa7LvuRIoDFcF/WKifs2NN5cJvzZpvhLjM7qpHak/V/F2idRmr
         4WJyIW0f9+G5Z3f/Plm23KBrbNXZjsTk48tYCnbH02Y+J1XEkPyTGRrArEtx4eGbvmIU
         tK47Su/KkPZ/17oa8mqlp7+tM2ibxw8lI+fmtyt6+DbHuAol0FHCFP47vmhEQzoNrAVp
         NCulJY0aXWdex1XC2V3596IMB2qa9jhNSmXZ7o9HxAg74gCoGi71itcgTq2+5qDrHww6
         KXuo/wK5lE0P8nILkzRRHyKOXc61UtjtT0ffoFwjVtP1mKIQ2yY+yL0pUbUGW2xqQ/0p
         Ee/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lev0Uzl2NB7E1zKkmfg7ofns5O41TRft58FfmsFp6jQ=;
        b=j/xydttALTXgozlU4xHVTpcWH5QYj+dWnrepN977Nby1NbLfHufgS9o6Ue5cd9pLo3
         iKGhcybWlawlF8AxUrXkrbO8IEcEvfdrmpsg3v9/zh5onL7wszMtIS7Lv2FMtbhQKbE3
         mYMbRO4NKkqBF8aj+k/jDxyVpXxwQYjG9WcKROFFtb4YUqXiFI0e6bVR+xbua5TE3iFE
         f+yKB/e/SYApStdw278kU9C5xj7moosQ0b6Nbs3z5ZAFAtQTgLYIrCdO8zHsskAYElzi
         iUyzcRawcwrt9Oa3sIOL4nv4vOghA4d8/f6AajfU3Z9PqJlgucPZHV2SZzbfSfEfoxPn
         oqOw==
X-Gm-Message-State: AFqh2koTgpmpOL1lgiOWqGA8BiYE2Waf9AyDcwubrLuOc92OxJlDE/1i
	SvwlZRX9NlNpItPd730IJPuaF7EojY6Arc3Q
X-Google-Smtp-Source: AMrXdXt6OrtZBBFbB8OI7WrjskTNp0smMM7r6BNcr9cTtp2gBPJLOJwP6+gzOdfUpSt/RdWvG6GAgQ==
X-Received: by 2002:ac8:498c:0:b0:3b6:33c9:eef3 with SMTP id f12-20020ac8498c000000b003b633c9eef3mr16670673qtq.47.1674180079043;
        Thu, 19 Jan 2023 18:01:19 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id z26-20020ac8711a000000b003b62dcbedb8sm7402314qto.74.2023.01.19.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:01:18 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/trusted-services: Fix 'no such file' when building libts
Date: Thu, 19 Jan 2023 21:01:04 -0500
Message-Id: <167418006409.2034248.17248951050076124601.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216175508.3149543-1-adam.johnston@arm.com>
References: <20221216175508.3149543-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 02:01:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4301

On Fri, 16 Dec 2022 17:55:07 +0000, adam.johnston@arm.com wrote:
> The libts recipe assumes generated cmake file will be suffixed with
> '-noconfig'. This is only true when building with the default type
> i.e. "".
> 
> Check which target cmake file has been generated before trying to
> patch it. This fixes 'no such file' error when building with an
> explicit type (Debug, Release, etc).
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-services: Fix 'no such file' when building libts
      commit: 13c7463c9fe948ec62e3b7824a7d5a882124f500

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

