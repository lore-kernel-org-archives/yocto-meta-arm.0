Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D788C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:18 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.20656.1666625236717515039
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=fCLcLuXN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id b25so6259968qkk.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhngRiPDeEoroQ/MQMad+rRRzDalnSpwEN0dBay9DV4=;
        b=fCLcLuXNw6aUO7+XmrADcMfecCbdvO5bf6d3i4WOluB23aNPnOjxmiby+j5c6H7PbC
         aV+F8XoQhoZfrZkLZ9KfDZN6NHD52fJYt1xBBdKTqy/q6bde2sivGCn5PLK3ZYZDQErf
         0OH2UW4eFfTx+NIubYMWeoT6m9kXOAdyeGZs2lL3GUUuCWli+Zz318zhiNi7SvMB+bwU
         5hOX26O8utzDJ5wK4wpDs2MeLonQZuIzClcGE8JixCVJ0jSKQIqrmMRt+osoF1PUNmNm
         aUfWBkKoRCSVqm202/aeGs4AVOHtSv9Ym/HAo9V9ylZD/7Yvo4j6i+SlRlP22fjaGdJd
         3ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhngRiPDeEoroQ/MQMad+rRRzDalnSpwEN0dBay9DV4=;
        b=JNuc5st6JItxRGBvCUb9cWIsLzQKlY4UHxe1E6/wNfoqcknG41qfqfe7FG9+sZErwm
         SXun19kBcBmhCqX8qOhpLTFLpWcc6w6xbBeEbqwMauqEjn1pa1JIPq/Ksx3gKxoPai5+
         jbD4tIKYL+70PK0rKCVS32wsLc9yT7VTyozzI9az0EN4YKETQ4XIgByFK6L2MulJiSIQ
         1x+QrcPzO4+35pWlRhgN+bVONp2+CPGZfOGg8ou14ThLyE3Kbb5QE85PHwtWqD4HvCCR
         qyrF2Ea7IFhoawe4TtfGo37Dn4QZkFj2zUkOEe/+sCB+PcSxVrMCJYVjkQbGEbl4s0QB
         fsqw==
X-Gm-Message-State: ACrzQf1r16A7+NGWbg166JVzy+gOwbF9hZBjWYkUSoc/XhlNHySHrML2
	Wv3prm240BE7aOP5yLRzlVHu80+I2SFDXA==
X-Google-Smtp-Source: AMsMyM6CdT5N173oGvZVlNEOS5aYp9ZgR2Z4WYYISldxhWkqXoRwha8gChgjytZafRhsKMabPI6zxQ==
X-Received: by 2002:a37:ba04:0:b0:6e7:cc52:969e with SMTP id k4-20020a37ba04000000b006e7cc52969emr23681849qkf.412.1666625235355;
        Mon, 24 Oct 2022 08:27:15 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id f18-20020a05620a409200b006ce515196a7sm175811qko.8.2022.10.24.08.27.14
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:27:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:27:14 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth update
Message-ID: <Y1au0qYZvG0tBMPe@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:27:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4024

meta-arm has released an updated gatesgarth support tag, 3.2.4.  The tag 
contains 1 patches from between 04 Aug 2022 and 04 Aug 2022.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.2.4) with a yocto-x.y.z tag (i.e., yocto-3.2.4).

Thanks,
Jon

