Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50805C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:52:07 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.281.1668027122964589361
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 12:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=70opD3jU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id z17so5395135qki.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Nov 2022 12:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dDE8dQ50jbTAI4bMpUiC7otJ68F0ySABWWDPkGuSGQ=;
        b=70opD3jU6gCiU11WYgp9G6lYDGyppW/B+Fu/DkFD9vsuOLevsdvUJOc6ziXw2MTBPZ
         0GzP17/dvb6XVjmodwIrcjCyenJi6nm+6VfvzTpOZAx3CTPvNolURozhmGvgNz5eqBRu
         yxzBLf9ooNRbSMxsap5GcuB+XxmH67zd80Ojm/YAhIzqvGtwDqWTAqNTH11eZQ3DdSjb
         UqX53f+tpczFoBSiJ2Q1rerhNIl0JyGzjoms2uEZz6kYOtg2bH0UjA4CNQwCDURTLsiH
         cSBvofiY/51uXUgCIobzZHDVY8Tf30NyBkmdmVzAx3WDIskuEFxlFIC2gm8PuLEW60+u
         DF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dDE8dQ50jbTAI4bMpUiC7otJ68F0ySABWWDPkGuSGQ=;
        b=NfHhAAh//+XXUWxK139kM8wWNptRhX1nhSiyge6xsJW2KbgSf5Wv+iHPoNj7oDT1li
         rchOtzVjwWprs3tnTypHODuvQOKjfN4E3T4x97HqlZyJMSQ99n9F5ofpuLWhf666nSc4
         pRoca3bPobFweScVjaZjDeIlHGShezAWYzPv3F1RIyimCkPW+crXTnkrkcwR+T8tDhBD
         KtDkmhgQIdOib8IwjGRpjRJATq3Zusw7vTEWVm3/LIGPJjOhzVkDh/+0WR+zH7pvk1G9
         4P7A7Ximn0MZcBlQOclAiQpp/Y6gPPBGeehNT2CgJPQd3EVz9ei0e3B6A9jV3uLErNx8
         1eLg==
X-Gm-Message-State: ACrzQf0S4X7Cenos0r2hzGuaaFw9o+/QRls+XK+gw75mwhV8VBEDQhhg
	N+YEKtwcSXXVKRsbvhVD408fnQtiwUxgJw==
X-Google-Smtp-Source: AMsMyM65EQ42a+rldTzi5PFtv+H4kjXAHQPM6BGgUpyOkPXcCr6D/4euy7nHiojkdnSfEbiaUjDpmQ==
X-Received: by 2002:a37:d285:0:b0:6fa:b066:dff9 with SMTP id f127-20020a37d285000000b006fab066dff9mr16264098qkj.203.1668027121523;
        Wed, 09 Nov 2022 12:52:01 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id c24-20020a05620a269800b006e2d087fd63sm11715134qkp.63.2022.11.09.12.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:52:01 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH] arm,arm-bsp/recipes-kernel: don't use PN in arm-ffa-transport.inc
Date: Tue,  8 Nov 2022 13:20:18 -0500
Message-Id: <166793161844.3257780.13756902987767645941.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107091145.4373-1-luca.fancellu@arm.com>
References: <20221107091145.4373-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Nov 2022 20:52:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4117

On Mon, 7 Nov 2022 09:11:45 +0000, Luca Fancellu wrote:
> There are some cases where PN is not expanded into linux-yocto in the
> arm-ffa-transport.inc file required from linux-yocto_%.bbappend,
> because of the := usage, in those cases PN gets "defaultpkgname".
> 
> To fix the issue, rename "linux-yocto" folder into "files" and adjust
> ARMFILESPATHS to point to that in linux-yocto_%.bbappend, prepend
> ARMFILESPATHS to FILESEXTRAPATHS in arm-ffa-transport.inc.
> 
> [...]

Applied, thanks!

[1/1] arm,arm-bsp/recipes-kernel: don't use PN in arm-ffa-transport.inc
      commit: 387f32242ec314f9a4b6eccc2105b61ff96fbd17

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

