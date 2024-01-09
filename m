Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D9FC4706C
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 20:27:42 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.28058.1704832059365793003
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 12:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QJVchBFl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-429994e51fdso10125751cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 12:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1704832057; x=1705436857; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bI+zhTHqyHjTo9HD7Ej8lJLuDRH0M5jSF/O194FHis=;
        b=QJVchBFlumaOvM9OAGREu+jWu7fcZeZ2Ei3pKF6pIgHeb0YagQxh7Kj9iask2rXKwa
         KvX0kd+FoGyziIfI9tBVk3Iig4r4EpxbDIrTYKkAfiEpKcs1nfmQlvhicHt7zHRECKFl
         QfEoJounIoLJHzpebd1A6XhMBYIIRy3SRZv5521NAoNBt9vQsaGqg52KgD0Vi+9ZiE5/
         DhLScbFRyMRM0mXdc/cpXKbumNVGKAcT8PM7/YVEszOr5KSdBNoppvC/aTwuO0nXJiJO
         SobBPFvO9Z0ppWspXyUCQX6k/RZIXtravAPoQ0wtWQUm5BXXCCWvqRUaKofWMg4EpNkE
         JdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704832057; x=1705436857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bI+zhTHqyHjTo9HD7Ej8lJLuDRH0M5jSF/O194FHis=;
        b=P3yeEuuKdxpuI7Gmjea8mS2k1hXUNqrU++Px7IkHUGQK/Y1dgjX7yTMHFmPL5kUmFm
         HG5IFUGVPJMK/YfQsafQFP1d26Sc4QVb1JTyiTb9PVIyADVPor5G5uEgFm1rGoSf+i3E
         3/kzEaDthx+AlhH/qneXlQGc37l/inLvBySxKmEWwde01sLHWfT/eIusZPOcAlf4RIfo
         BUDjMBJz+/B19WpRQn13310jWunH5rPES3oPsRU0Un8THtlSv/kTqmGqrJZwzRNwcPLe
         TbuV20n3J0nXqPY7ZhVsSrHiRZT+vcgcLSEqh3XtzngNA0HPeNKb5ZtnYT8Bppo4cK0l
         u9sQ==
X-Gm-Message-State: AOJu0YwSmKZxE1amxdaVAV648R0hb5n9G62AjRhkN0OOoJLaxMOIAbAY
	nvZQObF+S4Vf3FoUasbc+4e6fBE9bWvoJBXmv7W+DdaPJw==
X-Google-Smtp-Source: AGHT+IGiLz6fI6MJB9z752QfVdMfxp3ajT8h6+N2zQNm0zR+LPN7Ik4Xv3XP1P/o+tyWNH9E9ZrTqw==
X-Received: by 2002:a05:622a:1105:b0:429:9a2b:89d7 with SMTP id e5-20020a05622a110500b004299a2b89d7mr2767685qty.92.1704832057468;
        Tue, 09 Jan 2024 12:27:37 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id fh7-20020a05622a588700b00425442a2f32sm1167277qtb.16.2024.01.09.12.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:27:37 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/scp-firmware: update git repository to new location
Date: Tue,  9 Jan 2024 15:25:36 -0500
Message-Id: <170483193676.2807920.18075523915518667503.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240108211911.29422-1-jon.mason@arm.com>
References: <20240108211911.29422-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 20:27:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5328


On Mon, 08 Jan 2024 15:19:11 -0600, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm/scp-firmware: update git repository to new location
      commit: 98cf1495dbca946b8c6a82efdfce0afb63ff41e2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

