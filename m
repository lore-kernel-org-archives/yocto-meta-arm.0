Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43375C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:58:40 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.44740.1681135119548152252
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 06:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=J5Tdcbbc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id do13so3278197qvb.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1681135118; x=1683727118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU5Pv0PMBoiDKyQcWOvBmgNk66d6inlcHtf8OsysWRM=;
        b=J5Tdcbbc+dBl1euqn9cgXXGUt59ahFWtmjPj5C4KJwJ3bvooEvvlWewFhpwiQQJ8F+
         UOeC+EetU21IFXuZo/4bv/gPUwfg6uNqJfCM3gcyIiAW1hnSIcSKaZ2kVrizAolGXgvM
         /WT8sEJmm9WCt8qNAgm4uokTWxstSB/1ZHemceXutCrhQsTuUHe+6cUa5Sfw+hVIEDtt
         JIpBOMQ6ibWBhZ3d22KKJX+ueqhUHBKpFpTs4m7GY1PbPQQzzCZuuOUNxAcaKtyopJCJ
         d+GkfPIPuI35UBWKJgtAqejvwTWqDU1EZ6aqGlfnDBQ/RisFoBZ1tbw3X4DeNN7AoDCc
         WAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681135118; x=1683727118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU5Pv0PMBoiDKyQcWOvBmgNk66d6inlcHtf8OsysWRM=;
        b=L3PjXSw+pLRNZ1qXkM7xB2lHtG4T392tSgFVmOfa7cZjWHk48y2UeFQ6cH3AlwV1WG
         LTEffsLruHjlI2l6uoy9TXkOoumky1ruXWM85EAexTfMyfz7RmiTpVSH6CIxNjGA5omy
         iIRlbx7pzVHf+XRUC44urjCWAta3dgqlSWp5vp7/EofC0x19BMmtH8jEDZrvCHZAX6Sa
         Lm57nWbMdOuYcMK0yqbFBcFimu/0xFT04NfFCAU9zzVPGm7CLaBRk0VDe+Z638KmvXFW
         28iYEJ7soS2CJMvwEssfieHyqsD7zEMJ90KBw+j9UJ/NNXL3dRmEc6uozVtxMxfTyX/X
         0VLQ==
X-Gm-Message-State: AAQBX9dTurUkiFrDxeZIP8uYCBMohq7FZIGMh1PRT4bH0ByxIjd/zcfq
	BSmLUMBXptL3AWS7LFjJ6IYDTlr9+Ob6tZwgjig=
X-Google-Smtp-Source: AKy350bW0XtWESed2HPyUbL785BXfu4Po2arg4loQ5QoUVA4qpsrzTgQn8rkPcO16z5paqSz2Pu9ZA==
X-Received: by 2002:a05:6214:29c5:b0:5c9:a0ce:df0c with SMTP id gh5-20020a05621429c500b005c9a0cedf0cmr13259010qvb.22.1681135118258;
        Mon, 10 Apr 2023 06:58:38 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b8-20020a0cfb48000000b005dd8b9345b5sm616165qvq.77.2023.04.10.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 06:58:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Denys Dmytriyenko <denis@denix.org>
Subject: Re: [PATCH 1/5] optee-os-tadevkit: remove old unused patches
Date: Mon, 10 Apr 2023 09:57:48 -0400
Message-Id: <168113507110.1591809.9712786758556704846.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230405232218.1563477-1-denis@denix.org>
References: <20230405232218.1563477-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 13:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4569

On Wed, 5 Apr 2023 23:22:14 +0000, Denys Dmytriyenko wrote:
> optee-os-tadevkit is a variant of optee-os recipe to install TA devkit.
> Even though it may not need local build patches, it re-uses SRC_URI and
> FILESPATH from corresponding optee-os recipe. This was mistakenly added
> in b061104c87ce58fcc1e9e4791a8339b7af583a09.

Applied, thanks!

[1/5] optee-os-tadevkit: remove old unused patches
      commit: 8f62e0bff87d4fbf1ae60ca0b991efb4af29655b
[2/5] optee-os-tadevkit: add 3.20.0 version
      (no commit info)
[3/5] optee-client: add 3.20.0 version
      commit: 32908f1f9e56e4110bae7b367290c35fcc20f271
[4/5] optee-test: add 3.20.0 version
      commit: 3a7f74605750b9897e5bfcc606ac564f96cbdbc9
[5/5] optee-examples: add 3.20.0 version
      commit: 1f2e4e7ff5a65e3ab02c9e1df74877a85c1cf7df

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

