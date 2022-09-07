Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C21C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 03:14:42 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.3541.1662520478841981357
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 20:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=enxV/on9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id h21so9542788qta.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 20:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5vNIZwq0RuVqPtsJKQ8YIuWaHlmMfDhVla81+aY+8Gc=;
        b=enxV/on9fYmYsPSHYN2XC6geDYIsxKDntxZmej+yxV08MzjRkBQMqYg6DgB3FKiovA
         Ra8gmIUhxIipIxZxkuyidLAX9Sid8wybIvoOT/MqMqhLFP70uw5N8FWodmHHwEo8g6C6
         AU3U24FEGVi7PpfVl02LDvwefvD5b7+wNx0tE/Gwp1l6k/KbW49VFB7mUMRyqi9QcAEQ
         +nnrZsFUv1E6Ug0+tJsEv50oorGs64LiiJE5zJtafc69qRlCGtgQRrtoMVqzEoopDX8t
         bDIqNOXQbdnmKJchMK8C3jK8RhUQYTG/EbrWTnHFspBXf6HtmXSTmHL83QyBQHrwVBxh
         4QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5vNIZwq0RuVqPtsJKQ8YIuWaHlmMfDhVla81+aY+8Gc=;
        b=Ra9FcsT8GMEfh57fhaH9Hynk6xZa3v5khRY/ghSi4YPQA/MiBY3t8cAmpxJiFCDXbd
         SMosNYQN42J5SSvzjQlfi8fBt1aLww+NZoRWMAwyfYFtQzlKCCg4clNTt5X7ji0BdvUI
         9YMr4AbotpsL7La+1vaGAENlCR0bozNg7zOmXMJeiYO+DttnJpjPOcOypEs9go68jOIW
         r1NITpKhpJEbM4ak6NZMriCXmbhkN8xT9VAZh3R54ffqZjNZwQOOhI35euq1fwAt1mCo
         j547mT3YUiIUIdorhYkMRBj92VA0hK8UhDfuwvCrX2QmVTSb1Vay9toEDGkaNYqRCIUH
         IAqA==
X-Gm-Message-State: ACgBeo33nu5O2DsICpj7sa6NSLjtdVBxfTEp3PmcGQHH9c3WVDc0o3p0
	d834hFGx+sV6C76oq31/X0qLlIlMpkNkiuFL
X-Google-Smtp-Source: 
 AA6agR66hFBscGb0C/+PZAYSMSzMd/4s/qrwoi5Zu4ahs4MEe4vUdyG/y3pe1h3KZhImzlJbc9944w==
X-Received: by 2002:a05:622a:1a01:b0:343:310d:fedf with SMTP id
 f1-20020a05622a1a0100b00343310dfedfmr1581361qtb.622.1662520477521;
        Tue, 06 Sep 2022 20:14:37 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c5-20020ac80085000000b00342f844e30fsm11169814qtg.31.2022.09.06.20.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 20:14:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] gem5/linux-yocto: upgrade to 5.4.205 and fix buildpaths
 in binaries
Date: Tue,  6 Sep 2022 23:14:23 -0400
Message-Id: <166252046407.1129980.10245734516675125749.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906152604.238831-1-ross.burton@arm.com>
References: <20220906152604.238831-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Sep 2022 03:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3742

On Tue, 6 Sep 2022 16:26:04 +0100, Ross Burton wrote:
> Upgrade to the latest 5.4 release (.205), and backport two patches to
> fix buildpath errors:
> 
> File /usr/src/debug/linux-yocto/5.4.205+gitAUTOINC+e8c675c7e1_8a59dfded8-r0/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR
> File /usr/src/debug/linux-yocto/5.4.205+gitAUTOINC+e8c675c7e1_8a59dfded8-r0/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR [buildpaths]

Applied, thanks!

[1/1] gem5/linux-yocto: upgrade to 5.4.205 and fix buildpaths in binaries
      commit: 1f7e8b6de90a794a8740594e2f150d371949ccc6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

