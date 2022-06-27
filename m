Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D2AC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 14:03:38 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.41897.1656338612710533487
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 07:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=UlJPiAgH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id u124so6828663qkb.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oVNJy9sf/r6i15Nsyz1BuwiDLL9s5BF9ZzUf+PMsqf4=;
        b=UlJPiAgHHS4QigMjJJ8aLoARhJfPMqTlts9q+1pRGzsxxS6vy31DqEEMBjLOFdpZgZ
         shSqMoSov7Z9X8c6K6PqWxjhr3fV3ews188mIMu2hMRZUDQgBRGAfQpGuXZfju30LW3j
         4/b9pmUIa71K5b/TlH8Fyb5I9AAsN+70vyK+rVlObOErXqVA+2k309oEBy8SekQWq2DB
         lZBdGA9ItPX2TlCaGMIx19Y08XwAuVNs7fHWxoBSyUbkgfLfixZegWQsnC57bVzydpaK
         ck5QAZhOGqx7PYQjeZG4lvuVbDVQs/1nj9Lz7dp4iWwGGCbx54dgWT1RMSM9/Rv53zpm
         hz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVNJy9sf/r6i15Nsyz1BuwiDLL9s5BF9ZzUf+PMsqf4=;
        b=huF53XzIBngoIfrskDO7pJJ7fd69pgu1CkD4BZ44M4Beaz7qefJm4799XAN/RhevCB
         /gp49SNl3RkkHz4WjTxJz7pD3lyTaJ8CnObZdbqQryfONcBUS262czmf2WjUZ1Fb9Qxv
         vu4ohjF7Q/9q7ECQK8s4i1LViKzFgfiKFPqYqpLytJdzl3mXZX+7BtACVqfhhY7RxzoW
         KZNwd9H/YehOT1580nfGG6Hg+/5/Z1YxfVa9aosy/h0bT3P1UclowK99ZMTbsK/VzUit
         qbl+Eds3+lWDeRF5H1w54KgC0dd8K1wuaXgKmfxspr68eW7dCuQhAifhknU5dph3LlS6
         1ZzA==
X-Gm-Message-State: AJIora/ZBbk8RI12xiFD2PXO3Ioj5fhJcO39qumpJ4Gfs5ZEn2L3SW8a
	bBwejgqOSPYZzC5g+9vw8EP+M83lb9pWgA==
X-Google-Smtp-Source: 
 AGRyM1tvnH6PT0BIcvSgC1EOds6SkkjNi/Go9eQEVpSNS0R+NymA8lf+MkePrlPj909EhLNOgwHAsg==
X-Received: by 2002:a05:620a:172b:b0:6a7:61b:9bbb with SMTP id
 az43-20020a05620a172b00b006a7061b9bbbmr7987732qkb.23.1656338611451;
        Mon, 27 Jun 2022 07:03:31 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 z16-20020ac84550000000b003052599371fsm7163561qtn.12.2022.06.27.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:03:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/edk2: add support for qemuarm and qemuarm64
Date: Mon, 27 Jun 2022 10:03:27 -0400
Message-Id: <165633860716.2902527.17958149222042763127.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220620152913.3563-1-jon.mason@arm.com>
References: <20220620152913.3563-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Jun 2022 14:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3540

On Mon, 20 Jun 2022 11:29:12 -0400, Jon Mason wrote:
> Add basic support for running edk2 on qemuarm and qemuarm64.  This
> necessitated the need to add ACPI and EFI to the default kernel configs
> for these machines.

Applied, thanks!

[1/2] arm/edk2: add support for qemuarm and qemuarm64
      commit: 493690f0d1defa2d92148aa46bc8f9219b7d21b5
[2/2] ci: update edk2 yml file to work with qemuarm/qemuarm64
      commit: 47264aff0ba88caf6c7435fb2abc34d1c91ebdfe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

