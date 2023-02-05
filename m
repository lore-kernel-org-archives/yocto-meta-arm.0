Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AD3C63797
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:00:36 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.26182.1675591227699120570
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 02:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=A7I9Hurs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id d13so5507424qvj.8
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/WRV1Oabt+rggVo0RUQMUHdKRoUuxITgdRW30s39fY=;
        b=A7I9HursZgtdLoxPox00Nu5UfZKrZxpm8+6vv9XnCRzu7zz6ENgzPc8ib0qWrlS3oi
         yz+ZE7vKsJAxUZmiZZZGwbn9pOQ5rnzuCLSIKe49OEobIyLBt7l61S2yXsq1hHHs/dU5
         SJDWvz1MOnazjyt3dmxBeuz1vbKcsuOYdcBtd1flETKy4IzIzKBm0Eb+SvlDQPllCMI8
         iJ2cZflnd/RWDYuHfOipA0NBsL0hZ2dVk+asjKu/WHZoWdNb2upJS7lmerBNV3sntet6
         TJYc6xEbv2dOVFRB4GU2DbHTc8Zu29vQ99GcmadIkKGzI0xo91mqtoVbPet1tMJUBRYw
         6Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/WRV1Oabt+rggVo0RUQMUHdKRoUuxITgdRW30s39fY=;
        b=tcA+E4mIRPaX/pZtZDePfdm01GM6kLEXuFvhRU/kDQZiUDX6bmfgojsNUmoCgx/jSp
         IQZ+CHxaoXMVqQhFOx4IVIKAiESD7dCWizUkpFR4SzWTvmL4im9dnMgTCnFO5DymLQbS
         5Bl9pJatIvqj2lED5a63qM1Tz0ZEuKucUUSH9l+Bdfjw0XctJbDqZdskFDXTgAktvSKT
         ap6cF+ubbK5QSmr9UV1KY5RdfuZSdOJtJef620ZCJwvTb2gjDovYXXYphmg5dTz2PuTt
         WbbcqSlYxVM3oamRR7gBaH1Xf5KXuKXtMYMmC925fVDF89YpS76BDLw+dnO5zdGSbYyi
         KsCQ==
X-Gm-Message-State: AO0yUKWzXFeRZWPHkmTfsXWzh4p5HH4dw4SzLgrYURLODAOps+gzeBkl
	dFrURcGV3XZak/zHYVTD5JehU5aYQnvFJN9sVak=
X-Google-Smtp-Source: AK7set/1c3coTfDkX0eHWv30EWC8Thh2M92Zxw8dVloD2rusXmvCAr0tvfQBlcj7BmF2rJ1l4hiTDw==
X-Received: by 2002:a0c:e1ce:0:b0:53d:2a69:1b7a with SMTP id v14-20020a0ce1ce000000b0053d2a691b7amr23047380qvl.19.1675591226409;
        Sun, 05 Feb 2023 02:00:26 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id g17-20020ae9e111000000b006ce580c2663sm5315890qkm.35.2023.02.05.02.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 02:00:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] gator-daemon: Fix build with gcc13
Date: Sun,  5 Feb 2023 05:00:17 -0500
Message-Id: <167559121905.1756899.430163230845035864.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230203011440.3673351-1-raj.khem@gmail.com>
References: <20230203011440.3673351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 10:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4363

On Thu, 2 Feb 2023 17:14:40 -0800, Khem Raj wrote:
> 


Applied, thanks!

[1/1] gator-daemon: Fix build with gcc13
      commit: 37fd476ae1f21962d8ae9467baad238d0df1a240

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

