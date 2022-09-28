Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DC5C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:29 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.8007.1664372544182070693
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TClZNVBh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id ay9so7959739qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=sRdFZxp0fbEJZRrw5G63yaVuaDxg7DCqnRR5bnI9gVA=;
        b=TClZNVBh12Jsf5KSlViST+zonu6pUSsU6B8QfSqeNamlNLms8a1IPyQy2ss/8DdmzX
         j4KFeeYEdRtOi2bp5ZWaAbt+jK2YLM0ky/SwwtRFsbHKxfG7D6XwT6mCTWaw8ZxOb0ry
         ypso3S2cgJDdsTLPuwSFF7h9+owMEXmzkuJjR4sB6XT2qyUgj7hO3ZN53nwJVg/AKG9w
         ILYiOduTXaPuf1rF0iS9s82yH/51wsLsTADH7CYBoZJePxQI/gz32Dh3/PAXj6Ha/6H3
         D5o9Utf9yWFYG8MIhsPdAkIUYFqABG/U2ulzFFbYMTKmMmMCOKF0vKsl9MzAmf5d4uLS
         6mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sRdFZxp0fbEJZRrw5G63yaVuaDxg7DCqnRR5bnI9gVA=;
        b=pzEg5MEULgPY3jSKM+EAsrRxcNNYYNpZ6ABpN4yhZvFse+ZmFUZQGgjF/clwjhjYtA
         zfjfUdSlyIiBBgNE0rIl6rqJplUP6ue0XOga/fZssWYMo//C68wBtsKhPKBLAYKF8LB4
         w+76w7D4707ZqBHnIpWF+oqFT8fq8OAd5a4ugy9N/jLqyKBtDs1b/DjGIIYEBVrwbcFv
         y3N5/D2OTlepks9udKRhia1HE3s7Lq9lwIas7KrVpYcKNVtEjRvtgIS/wIBYsFjCYhSf
         Rh7imKkncWcOf0ERa+itpgVSTYFsBTXCXzHHtTs+Xl1wik2wYJzpiQwTP2Gw017asACe
         bwAA==
X-Gm-Message-State: ACrzQf3zRsPkFce7zN0Ayfw21izWaY+H+B8sm3YhZ0wERAe8Ch/BnkVP
	q1RyWYVMi07EubIaoeDZwDlcp0kowLnd6A==
X-Google-Smtp-Source: 
 AMsMyM7kYNhA9MtmyE4AvxgeXFRMqX1Mc6DBrFtKQ6WKIY5sNqEIJnTlugKVKelLzhwPRIJ0kUpNzw==
X-Received: by 2002:a05:622a:1185:b0:35c:e2c4:7a4e with SMTP id
 m5-20020a05622a118500b0035ce2c47a4emr27741680qtk.241.1664372540506;
        Wed, 28 Sep 2022 06:42:20 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c10-20020ac8518a000000b0035c1e18762csm2842930qtn.84.2022.09.28.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] linux-yocto: Add bbappend for 5.19
Date: Wed, 28 Sep 2022 09:42:01 -0400
Message-Id: <166437252283.2315819.2175686525341280521.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220912074647.3445905-1-raj.khem@gmail.com>
References: <20220912074647.3445905-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3857

On Mon, 12 Sep 2022 00:46:47 -0700, Khem Raj wrote:
> Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Applied, thanks!

[1/1] linux-yocto: Add bbappend for 5.19
      commit: 75ccc7847d8af5bfff4d6261a49530bb571d1a12

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

