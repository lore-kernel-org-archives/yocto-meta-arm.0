Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B405C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 01:35:38 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.11749.1660527335008427096
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1OInf58s;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id l5so4645506qtv.4
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=00Vnp1PkjlJGbrLjEnvGhAO5X2N7osfVjaHH8yu5ZW8=;
        b=1OInf58s02aGED4WFQbyHt7/ilE8858ar4gifu4IBoQDODvg4pfSLTgbHDAkhyQQ69
         Fk0DTjr/goupiDspTICFJd4JQ0fZs2+9ODigsH8CcLMtWbOtdWIhAZ45uTgDYnCxJPHM
         Nx5YmsChssy3DBxRCOyVr8ZeyeH1yZvpu9CrUpbzDY99ewf5jg+km624Cxf4j/GfJ3zH
         lDi6CJCC7zTu8oXXC6OVraVrQTnXqUujfTpIFPQ00EX2FQt73M2eTHYnKfmGbhgvvhjK
         r3bR6LykeN6sM0yUPA7Tm3gIoJOJIFB/zZ0/beUlPXnthEiJrS7JunHrlVGjkWL7swKg
         T8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=00Vnp1PkjlJGbrLjEnvGhAO5X2N7osfVjaHH8yu5ZW8=;
        b=v1WdJCQQ+7NchKBaF4X8cDpxwAxiXbnlakOEpB29WnVeSkY+0ItXXpzb0riN1CVdaG
         qssb0zYixbtgxMWdJ6Qp3qCsYT2Q2WcqEs6tXpEcu4AMzmFOIV60U3zrhh5ytJWFiB0X
         qTj6fNQ70YSsDNgte4RszmpfFJE3DEcimXDK+9QvPvx2QSy3Gx1w2g0Vc/Gu9pcSCVNw
         5XK3lgB+j8XzyjCeiDB0ZJdeLBSXFb20k2ffN8IH0Mf9N83OGHlUdyxEJZGIPYXiAjo8
         aVZwRfkveRIEMeBArt9xipjurnr5ekAYzvSTP/D2ZHaTjEVzWaEf8lFVM2fvEKoZ8lAR
         RNcA==
X-Gm-Message-State: ACgBeo3Ct9tP75ZDzxTdqPDG0AfxexmFynLsBqegbjQHUESzGfg3B4Cd
	z9j4gULTUcayJOr3+DP8GjCfR512zqg0iKyf
X-Google-Smtp-Source: 
 AA6agR6h5mrqL+74/JALhq/bH00zwdtqWguSYuMUAMBlA3S6przlWxTGHjdOR/LHh51NLNYYPcbXUg==
X-Received: by 2002:ac8:7fcd:0:b0:343:77f6:50c2 with SMTP id
 b13-20020ac87fcd000000b0034377f650c2mr10081264qtk.353.1660527333653;
        Sun, 14 Aug 2022 18:35:33 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 b13-20020ac812cd000000b0034454067d24sm3843938qtj.64.2022.08.14.18.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 18:35:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v2] arm-bsp/corstone1000: rebase u-boot patches on top
 v2022.07
Date: Sun, 14 Aug 2022 21:35:17 -0400
Message-Id: <166052731728.2952774.10904457881489343443.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809182607.117833-1-rui.silva@linaro.org>
References: <20220809182607.117833-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 01:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3683

On Tue, 9 Aug 2022 19:26:07 +0100, Rui Miguel Silva wrote:
> Rebase the u-boot patches on top of current u-boot supported
> version in poky, needed some adjustments at efi loader.

Applied, thanks!

[1/1] arm-bsp/corstone1000: rebase u-boot patches on top v2022.07
      commit: dfe6d2f1ebb9a5a4bd56404b491b49d3b9997448

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

