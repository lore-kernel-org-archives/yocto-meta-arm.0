Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B36C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:29:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.905.1664990992684556969
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6zKymo/X;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id h10so9179869qvq.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=addYMLecqM7YL+CAq5pwLjH5ONsAEGvaO0klqAA2Ago=;
        b=6zKymo/XhbV7p6WQbvLew3Eda5T+GUbJGUhf/NCAliv5xg6cCcKOhq+G5YimeNg39M
         wQqpDBXVpM7aO73a0KCR9AbddmPVvBDtOFyOm6/J3Cu9wmA3avdX0J2cH8GdfTJKiYFo
         hdvUH4235mfKD6M8fNKvBdVpv72Cuc1VX77iPChvnOkmUlOOQ85amAohiH+aI0o4ypxO
         ta5tL1QBt0lQYzwB/mIlBwhIneVNLOgvAYs1WL68MyStb8vtdeQfk7L03S/PCnlk5Gjb
         TZvfxw6VUTIw4Pw8xUMlGssxXTkpFIXBifBk4ym4sLc1Lj1Ivb6oX6krqLakLI+niJCq
         DzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=addYMLecqM7YL+CAq5pwLjH5ONsAEGvaO0klqAA2Ago=;
        b=BW2O7XXHzEy37HP4bCvFPD508DIukmhLdg4ZAGm1FdsTQJwBsuniZUCfhmJrU1z/X0
         XM/LW++KCS4r3Ucvxq4ZD4Ne8b3h+sIgtfuzemAqbJ1nTH493tuELIgJ/AMQ+b+NbZ3f
         WhSiU3CJh7qe0te04MgLuVh+BdlS03stFnSL0sCB9R9rtKrxCAHJdsTrTLl1va/pFBoT
         WQoNXEcU+v5eXBsbC4mQFGDTLW3kVTgpb/eG5ksDUVjs+VxvbX/vji64uUiUngAH3k44
         QCpGWBflgCY5Wka2BZ1lGK4KIF7k30RDByYXS8I6jMgzJ32+Y/NTjTHY7TovD1Tjjd+s
         uCLw==
X-Gm-Message-State: ACrzQf2LPr1o1C90fxd32agaRXSjDru8nMSb8Kf9knr5vqgLvYwrnMcT
	/IU8ZOkK4yi/8WJwoMzfhVR/aSZ+r9Jguw==
X-Google-Smtp-Source: 
 AMsMyM4SwYxdfiX3XMCFiwNDaWf8hOVMRRK8xOWXfbWFfAMUIvMZklP74B1gtMci0skz0gwRbICi1A==
X-Received: by 2002:a05:6214:528e:b0:4b1:d3ca:f30a with SMTP id
 kj14-20020a056214528e00b004b1d3caf30amr691914qvb.89.1664990991409;
        Wed, 05 Oct 2022 10:29:51 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a081000b006e48039927asm470689qks.83.2022.10.05.10.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:29:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/kernel: Update RPMSG_CTRL config
Date: Wed,  5 Oct 2022 13:29:36 -0400
Message-Id: <166499097864.3072074.2929047331640672431.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005115043.48660-1-emekcan.aras@arm.com>
References: <20221005115043.48660-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 17:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3938

On Wed, 5 Oct 2022 12:50:42 +0100, emekcan.aras@arm.com wrote:
> The rpmsg_chardev driver has been replaced by the repmsg_ctrl
> driver. This commit updates the defconfig to align with the
> change.
> 
> Emekcan Aras (1):
>   arm-bsp/kernel: Update RPMSG_CTRL config
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/kernel: Update RPMSG_CTRL config
      commit: 987966a5871f00df1261ff6789a389b8608559b5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

