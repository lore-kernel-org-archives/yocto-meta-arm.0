Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD3EC433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 18:27:19 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.699.1651602431587893372
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=2uXy0UtK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id z126so14439899qkb.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=psVxdQfn9GpEJxTC33Ox/+ABRn6ymVsjrCF/e3sPDIE=;
        b=2uXy0UtKDHWWX5WKPdyIOC3m8J6fGwlrICuHprnLhVk/GzBnb4tCjyuuy/aqB2ZgIn
         Dors6RI0aoi+fRxTBq78+A0ANcyUOT6rbybpNqWA+pP0ZHMge84JsGRLepjLDCwo3iH6
         6JytIAYrqalMIaDeNX/UmSKObKm3hn/RiuuwRw3wcGCQPUp3vnLC2RZpvh3Y8efPy8au
         lMGuuvG/PQPd4DW7v2rsonjzgI0oazJjsEVwgMINeB96r06gMp5Rf0XLbyCYrGrSCIpb
         j1+DC9sZXU7hKb3u8fP7MD9w3Chm5bcgN+0EY9SKq+PhuDlNKqUa9hgVPMLaxocbZ5LO
         IzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=psVxdQfn9GpEJxTC33Ox/+ABRn6ymVsjrCF/e3sPDIE=;
        b=Pd1xC+eT/nN/YMYVqNSE/9IIpcZNKvbgvgYUEZ43QPV3b5G55YhFmaJw/Hsni/bbZ5
         PbsRAU4YdcHOQhoFcurDRICFY80HB1snlW9WP5rQCaEAxyGSP+urUmI6qgEHA2qAZBA5
         omjgo1ppn5MnxRh3u1Kk6qWxhMfbBkP7EUAUhE+j+sLAdYu096sBxO0nEW97QM60Gt9l
         JAy9NVv545gSNKlq8RTF0RcIAe727JFDb5jMZMrr2pLt3ufedWtD6Vd+cjlJnICx4ikE
         6fMc/NZvX7yN0jJn3v9Srw5Ra8qqsuK7KH8j0/aUtWdEhFI1dRvq7lwE82jTILKBDkQs
         F9UA==
X-Gm-Message-State: AOAM5326EbR78JjYTw2FPoRhmzHnkxpWrmgtk8wCIUE8PjpiiZcSrD0l
	sTucJeI07cRjeuMz+KnOCZxl0QWdyaycUVzA
X-Google-Smtp-Source: 
 ABdhPJwlt/YLwdw4YuJwxRvb0PVRfRvSLzeQslEwv30rNPpokRqULKqk1uhoCiAGx6HZREPFThh4RQ==
X-Received: by 2002:a37:6287:0:b0:69f:c147:405c with SMTP id
 w129-20020a376287000000b0069fc147405cmr13016484qkb.16.1651602430496;
        Tue, 03 May 2022 11:27:10 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 t1-20020ac85301000000b002f39b99f68bsm6114208qtn.37.2022.05.03.11.27.10
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 11:27:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Tue, 3 May 2022 14:27:09 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm hardknott update
Message-ID: <YnFz/Z2iCDOrKsIK@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 18:27:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3347

meta-arm has released an updated hardknott support tag, 3.3.2.  The tag	
contains 3 patches from between 28 Jan 2022 and 11 Mar 2022.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.3.2) with a "yocto-x.y.z" tag (i.e., yocto-3.3.2).

Thanks,
Jon

