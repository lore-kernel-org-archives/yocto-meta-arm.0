Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D62C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 00:01:17 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web09.57.1643414475667555726
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 16:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yP3BrbZE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f50.google.com with SMTP id s18so9718447ioa.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 16:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j8UJXaeV7bLcNGG6PTGQ38gTIp9FrcApsTrCrFApqGg=;
        b=yP3BrbZEKgee7DyxA7qmtGqHYo1lqcxi9xcQwniF9eBWItSXRuyXjUyCsmVkd3n77i
         Dd7cp964W6Kcir0mUHy7xyrc7tU+VgGw3ZEo6EoLNYdOHns2/n1FVt2dcs63Hi3fNJip
         qzUsvJOndGfcAlp/j6/2A0tupPkvZfWWwuTm+YJ71s+4eBdwF0iFP3P3gG0SvowqmAGJ
         vvNEpGGw4Z/qICeZRc0EpiPBBrpITowYTwop8zycoI7y8msIv/1REPvvzD3RNnQSW6ug
         IvPQf0bsmKJh3qDpOq5GmB24+GqzpqAcEkMmN+ddschTvca97KHvsu1QzLBePzSfXmEN
         v02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8UJXaeV7bLcNGG6PTGQ38gTIp9FrcApsTrCrFApqGg=;
        b=iRUOXoU09uTKI+UvBx7I1FUtTu3yzo898CCG5FGLK+M7VSFViWm8jiuMg8bCLIUSAc
         S3BnkpaFj2qxjM0BT5y0sau4bkeA0I06bCZTG3nOkhQgg34yiOzR/VIkKekz9xrhho62
         1LHd2AEbe27T+Q8lo4hD/P7Vina9mfYoCtDvpExSUdMr2DD7r7EArICIwfqdcMcCf0nS
         A7+Wxa7mvP9LbmhA0HzLZeERQ5Wqi3/CRDnEqSmOrtpb22QAo0LukHLCzT/4IJIysTAg
         wDhEnUM2PZNK4QbyiFV8b8VwW3ykVt5Gn4xuDoXDS8hbCGqOl3cQYXwf2DsYc12BhZho
         Tgfw==
X-Gm-Message-State: AOAM532NwqFLev9pJAUqUnorXdWgGBTsDZ9oS+PUWXyLuJVUv6fSqlrP
	kd+Qbk3k5so/upb6qV8bGaZs/8Mi5G6SNg==
X-Google-Smtp-Source: 
 ABdhPJxyd5Pe8tdXXt54m+OB3m6EO9PhUkwm3oB0e2RtpJyQGz9nO7JxuceGylz4Fm+1PmkzfMsvVA==
X-Received: by 2002:a02:b15d:: with SMTP id s29mr6422323jah.163.1643414474762;
        Fri, 28 Jan 2022 16:01:14 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:b8ee:1cef:2d10:1f90])
        by smtp.gmail.com with ESMTPSA id
 w4sm15339738ilv.32.2022.01.28.16.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 16:01:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH][gatesgarth] CI: pin Kas container to 2.6.3
Date: Fri, 28 Jan 2022 19:01:11 -0500
Message-Id: <164341447080.1076903.1426243628648932032.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220128191840.2767463-1-ross.burton@arm.com>
References: <20220128191840.2767463-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 29 Jan 2022 00:01:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2931

On Fri, 28 Jan 2022 19:18:40 +0000, Ross Burton wrote:
> Pin the Kas container to the 2.6.3 release, using debian-10, as newer
> images use debian-11 which isn't a supported host distribution for
> Gatesgarth.

Applied, thanks!

[1/1] CI: pin Kas container to 2.6.3
      commit: a0382c6a57b09a0e193fe5c5e2a7de17b1f6f086

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

