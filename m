Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE1EC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 20:47:55 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.12023.1658868469202802187
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SPl5Pvf8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id g1so11926323qki.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/Bq3gfCm7ftWqFJ+Q5X2VU5bEHYNHpazw1OW4mEUP9Y=;
        b=SPl5Pvf8ozQYtZY20rW6aO14dJbzTXWxWJyhyiN3ZK5ZArXeOsCswrGUe94aTiO7lK
         xnKtDMDAazc9GPwNdKzbMytZ4rQwaCWfBIMzj6ILYnb50XIpVz13bHtGHbjZXR7aOy6o
         4F2TQ34n6iXO3lEhPiTRX0DotMo4l0MfratJrSCedwhhpVBCAkuMXRWk3j5shsyJn6L9
         1Duxc9miDG/Q7sVH8HUP32dd6Pdltse8VnQR+D5VAxP/6zCYAM5i08iu2QYcV0r9DzLC
         /XvOOnYjdJUXaBLoQmNByT+HIm3/DcfDn3TnwNz/kxqSBtj8AYMxag1h0/dRAZ59npnt
         G28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Bq3gfCm7ftWqFJ+Q5X2VU5bEHYNHpazw1OW4mEUP9Y=;
        b=IPsbow/g0dVFdvqrofNZzEiQRzNEXvnUX3lgP0U2JgbR7SsBsgr954l0BeFCAbePe2
         p6mdV8IECM3+cknJrLO2CjHHfuHqciVWaAQAD2LmlSTlNXvd8jDY487ghIndA+geqZ8w
         oTS0dEfBsWp96KMnDyzexMWbOqqHMTpTsaSRxWXJ64ZBg5y99DIwY/r4XhvhsAEAoSnq
         vRou53ALvMXoQnSiiVLW+I0nzU6YN3JYpbPpIn6rioGWDN1OpZHl68E3hSe+uGFxdzlF
         Qn4tt6YZhhhqxqopsbDjoSX9BOgUDgqdlaHKb8htDsj0knHoM1miAuKzBui7XU/EY3B+
         2h/g==
X-Gm-Message-State: AJIora8p6cT4N8Oe/GLKRtC9Nib9lQp35b1tZS54UydpYmRESirxX/O8
	b8isvcwgh0pK35SLOqTPcbCo1faNt3IZTQ==
X-Google-Smtp-Source: 
 AGRyM1uJbuxM01xkJJfgOVCCJ1OyoOGRH7LTDJAqK8CeMZ62sPMvg/mlPIFHlAua/BkeZaMxuzUWDA==
X-Received: by 2002:a05:620a:2493:b0:6b6:fff:a138 with SMTP id
 i19-20020a05620a249300b006b60fffa138mr13996455qkn.662.1658868467766;
        Tue, 26 Jul 2022 13:47:47 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 br33-20020a05620a462100b006b5f06186aesm11906118qkb.65.2022.07.26.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:47:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] ci/qemu-cortex-m3: remove common test
Date: Tue, 26 Jul 2022 16:47:25 -0400
Message-Id: <165852563543.759660.805961078115982913.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722162323.2508-1-jon.mason@arm.com>
References: <20220722162323.2508-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 20:47:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3592

On Fri, 22 Jul 2022 12:23:21 -0400, Jon Mason wrote:
> The common test has a timing issue, causing it to intermittently fail.
> Since it is not unique to our environment, remove it to prevent false
> positive regressions.

Applied, thanks!

[1/3] ci/qemu-cortex-m3: remove common test
      commit: 2ae5842553b19d6d4cd26feb3daf500f8541a9b5
[2/3] CI: use uboot instead of none for juno
      commit: da044c88cd2b57f14fb847b6cda1e5736fc24636
[3/3] ci: do sato by default
      commit: 1590c21805e49d3f292e5973290850bb627e564a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

